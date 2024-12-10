class AssIndexToTagItems < ActiveRecord::Migration[6.1]
  def change
    add_index :tag_items, [:post_id, :tag_id], unique: true
  end
end
