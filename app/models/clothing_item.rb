# == Schema Information
#
# Table name: clothing_items
#
#  id               :integer          not null, primary key
#  brand            :string
#  category         :string
#  color            :string
#  date_purchased   :date
#  description      :text
#  material         :string
#  name             :string
#  pattern          :string
#  price            :float
#  price_units      :string
#  quantity         :integer
#  retailer         :string
#  size             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  default_image_id :integer
#  owner_id         :integer
#

class ClothingItem < ApplicationRecord
  has_many :outfit_components, :dependent => :destroy
  has_many :tags, :class_name => "ClothingTag", :dependent => :destroy
  belongs_to :owner, :class_name => "User"
  belongs_to :default_image, :required => false, :class_name => "Image"
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }
  validates :name, :presence => true

end
