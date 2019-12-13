# == Schema Information
#
# Table name: clothing_tags
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  clothing_item_id :integer
#  image_id         :integer
#

class ClothingTag < ApplicationRecord
  belongs_to :clothing_item
  belongs_to :image
end
