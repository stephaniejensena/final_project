# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  post_id      :integer
#

class Comment < ApplicationRecord
  belongs_to :commenter, :class_name => "User"
  belongs_to :post
end
