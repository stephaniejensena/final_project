# == Schema Information
#
# Table name: wears
#
#  id         :integer          not null, primary key
#  wear_date  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#  outfit_id  :integer
#

class Wear < ApplicationRecord
  belongs_to :image
  belongs_to :outfit
  validates :wear_date, :presence => true
  validates :image_id, :presence => true
  validates :outfit_id, :presence => true
end
