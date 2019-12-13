# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  caption      :text
#  just_friends :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image_id     :integer
#

class Post < ApplicationRecord
  belongs_to :image
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
