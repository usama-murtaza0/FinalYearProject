class AddDefaultStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :delivery_status, false
  end
end
