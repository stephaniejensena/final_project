# == Schema Information
#
# Table name: outfits
#
#  id               :integer          not null, primary key
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  default_image_id :integer
#  owner_id         :integer
#

class Outfit < ApplicationRecord
  belongs_to :default_image, :required => false, :class_name => "Image"
  has_many :outfit_components, :dependent => :destroy
  has_many :wears, :dependent => :destroy
  has_many :outfit_tags, :dependent => :destroy
  belongs_to :owner, :class_name => "User"
end
