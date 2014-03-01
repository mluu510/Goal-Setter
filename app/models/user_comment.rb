# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  victim_id  :integer
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserComment < ActiveRecord::Base
  belongs_to  :author,
              :class_name => "User",
              :foreign_key => :author_id

  belongs_to  :victim,
              :class_name => "User",
              :foreign_key => :victim_id

end

