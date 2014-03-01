# == Schema Information
#
# Table name: goals
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  viewable_by_others :boolean          not null
#  user_id            :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#  completed          :boolean
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, :presence => true

  belongs_to :user
  has_many :comments, :as => :commentable
end
