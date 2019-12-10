class Post < ApplicationRecord
  belongs_to :image
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
