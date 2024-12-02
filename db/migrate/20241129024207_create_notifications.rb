class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notifiale, polymorphic: true, null: false
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
