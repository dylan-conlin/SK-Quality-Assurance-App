class AddHireDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hire_date, :date
  end
end
