class RemovePhysicalStoreAddressFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :physical_store_address, :string
  end
end
