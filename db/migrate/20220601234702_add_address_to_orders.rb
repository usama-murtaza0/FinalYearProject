class AddAddressToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :address, :string
    add_column :orders, :postal_code, :integer
  end
end
