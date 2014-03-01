# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  goal_id    :integer
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class GoalComment < ActiveRecord::Base
  belongs_to :goal

  belongs_to :author,
             :class_name => "User",
             :foreign_key => :author_id
end
