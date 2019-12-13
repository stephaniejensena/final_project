# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  bio                :text
#  birthdate          :date
#  dress_size         :string
#  dress_size_units   :string
#  email              :string
#  first_name         :string
#  height             :float
#  height_units       :string
#  last_name          :string
#  pant_size          :string
#  pant_size_units    :string
#  password_digest    :string
#  shirt_size         :string
#  shirt_size_units   :string
#  shoe_size          :string
#  shoe_size_units    :string
#  username           :string
#  weight             :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  profile_picture_id :integer
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :clothes, :class_name => "ClothingItem", :foreign_key => "owner_id", :dependent => :destroy
  has_many :friends, :foreign_key => "friender_id", :dependent => :destroy
  has_many :friendees, :class_name => "Friend", :foreign_key => "friendee_id", :dependent => :destroy
  has_many :images, :foreign_key => "owner_id", :dependent => :destroy
  has_many :likes, :foreign_key => "liker_id", :dependent => :destroy
  has_many :comments, :foreign_key => "commenter_id", :dependent => :destroy
  has_many :outfits, :foreign_key => "owner_id", :dependent => :destroy
  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => true }
  validates :last_name, :presence => true
  validates :first_name, :presence => true
  belongs_to :profile_picture, :class_name => "Image"



end
