class AddTotalBillToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_bill, :integer
  end
end
