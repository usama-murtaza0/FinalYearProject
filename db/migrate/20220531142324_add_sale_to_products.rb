class AddSaleToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :size, :string
    add_column :products, :sale, :int
    add_column :products, :packing, :string
  end
end
