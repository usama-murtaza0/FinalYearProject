class ChangeDefaultProductStatusInProducts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :products, :product_status, false
  end
end
