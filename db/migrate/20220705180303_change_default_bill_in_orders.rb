class ChangeDefaultBillInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :total_bill, 0
  end
end
