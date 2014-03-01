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

require 'spec_helper'

describe Goal do
  pending "add some examples to (or delete) #{__FILE__}"
end
