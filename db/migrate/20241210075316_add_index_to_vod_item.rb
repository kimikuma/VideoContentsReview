class AddIndexToVodItem < ActiveRecord::Migration[6.1]
  def change
    add_index :vod_items, [:vod_id, :post_id], unique: true
  end
end
