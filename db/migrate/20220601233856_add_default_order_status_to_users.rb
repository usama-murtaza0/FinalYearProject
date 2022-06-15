class AddDefaultOrderStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :order_status, false
  end
end
