class AddNcAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nc_admin, :boolean
  end
end
