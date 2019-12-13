# == Schema Information
#
# Table name: friends
#
#  id          :integer          not null, primary key
#  accepted    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  friendee_id :integer
#  friender_id :integer
#

class Friend < ApplicationRecord
  belongs_to :friender, :class_name => "User"
  belongs_to :friendee, :class_name => "User"
end
