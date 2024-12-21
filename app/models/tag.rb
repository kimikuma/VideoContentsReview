class Tag < ApplicationRecord
  has_many :tag_items, dependent: :destroy
  has_many :posts, through: :tag_items
  
  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
