class AddProductStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_status, :boolean
  end
end
