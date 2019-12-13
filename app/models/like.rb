# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liker_id   :integer
#  post_id    :integer
#

class Like < ApplicationRecord
  belongs_to :liker, :class_name => "User"
  belongs_to :post
end
