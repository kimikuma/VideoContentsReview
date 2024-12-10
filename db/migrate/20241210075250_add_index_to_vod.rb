class AddIndexToVod < ActiveRecord::Migration[6.1]
  def change

    add_index :vods, :name, unique: true
  end
end
