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

require 'spec_helper'

describe GoalComment do
  pending "add some examples to (or delete) #{__FILE__}"
end
