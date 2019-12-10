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
  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => true }
  validates :last_name, :presence => true
  validates :first_name, :presence => true
end
