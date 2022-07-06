class ChangeDefaultValueOrderStatusInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :delivery_status, 0
  end
end
