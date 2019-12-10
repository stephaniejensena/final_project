class Image < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :clothes, :class_name => "ClothingItem", :foreign_key => "default_image_id", :dependent => :destroy
  has_many :outfits, :foreign_key => "default_image_id"
  has_many :wears, :dependent => :destroy
  has_many :tags, :class_name => "ClothingTag", :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :outfit_tags, :dependent => :destroy
  validates :owner_id, :presence => true
  validates :image, :presence => true
end
