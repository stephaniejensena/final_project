# == Schema Information
#
# Table name: outfit_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#  outfit_id  :integer
#

class OutfitTag < ApplicationRecord
  belongs_to :image
  belongs_to :outfit
end
