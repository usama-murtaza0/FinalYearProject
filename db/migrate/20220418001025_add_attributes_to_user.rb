class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :integer
    add_column :users, :picture, :string
    add_column :users, :physical_store_address, :text
    add_column :users, :type, :string
  end
end
