class ClothingTag < ApplicationRecord
  belongs_to :clothing_item
  belongs_to :image
end
