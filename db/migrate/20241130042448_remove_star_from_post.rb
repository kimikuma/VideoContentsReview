class RemoveStarFromPost < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :star, :float
  end
end
