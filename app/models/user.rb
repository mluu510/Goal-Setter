# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token
  validates :username, :session_token, :password_digest, :presence => true
  validates :password, :length => { minimum: 4, allow_nil: true }

  has_many :goals

  has_many  :received_comments,
            :class_name => "UserComment",
            :foreign_key => :victim_id,
            :primary_key => :id

  has_many  :authored_comments,
            :class_name => "UserComment",
            :foreign_key => :author_id,
            :primary_key => :id

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def is_password?(plaintext)
    BCrypt::Password.new(self.password_digest).is_password?(plaintext)
  end

  def self.find_by_credentials(username, plaintext)
    user = User.find_by_username(username)
    return nil unless user
    user.is_password?(plaintext) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token = self.class.generate_session_token
  end
end
