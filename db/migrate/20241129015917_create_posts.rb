class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :title, null: false
      t.text :impression, null: false
      t.string :tag, null: false
      t.float :star, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
