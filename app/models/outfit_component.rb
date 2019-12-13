# == Schema Information
#
# Table name: outfit_components
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  clothing_item_id :integer
#  outfit_id        :integer
#

class OutfitComponent < ApplicationRecord
  belongs_to :clothing_item
  belongs_to :outfit
end
