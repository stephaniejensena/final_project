class Outfit < ApplicationRecord
  belongs_to :default_image, :required => false, :class_name => "Image"
  has_many :outfit_components, :dependent => :destroy
  has_many :wears, :dependent => :destroy
  has_many :outfit_tags, :dependent => :destroy
end
