class CreateTagItems < ActiveRecord::Migration[7.2]
  def change
    create_table :tag_items do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
