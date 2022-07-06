class RemoveDeliveryStatusFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :delivery_status, :boolean
  end
end
