class AddOrderStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :order_status, :boolean
  end
end
