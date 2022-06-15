class AddPicturesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :pictures, :json
  end
end
