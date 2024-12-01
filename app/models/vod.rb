class Vod < ApplicationRecord
  has_many :vod_items, dependent: :destroy
  has_many :posts, through: :vod_items

  validates :name, presence: true
end
