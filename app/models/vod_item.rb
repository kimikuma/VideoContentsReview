class VodItem < ApplicationRecord
  belongs_to :post
  belongs_to :vod

  validates :vod_id, uniqueness: { scope: :post_id}
end
