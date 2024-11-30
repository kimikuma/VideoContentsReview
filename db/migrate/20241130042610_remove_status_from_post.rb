class RemoveStatusFromPost < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :status, :integer
  end
end
