class AddStatusToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :status, :boolean, default: true, null: false
  end
end
