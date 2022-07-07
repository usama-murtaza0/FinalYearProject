class ChangeDefaultUserStatusInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :deactivated, true
  end
end
