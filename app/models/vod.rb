class Vod < ApplicationRecord
  has_many :vod_items, dependent: :destroy

  validates :name, presence: true
end
