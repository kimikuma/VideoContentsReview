class RemovePublicStatusFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :public_status, :boolean
  end
end
