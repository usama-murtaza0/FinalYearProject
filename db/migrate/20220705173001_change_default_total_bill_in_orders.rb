class ChangeDefaultTotalBillInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :total_bill, :orders, :integer, deafult: 0
  end
end
