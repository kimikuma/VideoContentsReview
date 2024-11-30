class RemoveTagFromPost < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :tag, :string
  end
end
