class RemoveOrderStatusFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :order_status, :boolean
  end
end
