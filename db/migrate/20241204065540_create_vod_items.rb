class CreateVodItems < ActiveRecord::Migration[6.1]
  def change
    create_table :vod_items do |t|
      t.references :post, null: false, foreign_key: true
      t.references :vod, null: false, foreign_key: true

      t.timestamps
    end
  end
end
