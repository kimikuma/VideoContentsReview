class AddStarToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :star, :float, default: 0
  end
end
