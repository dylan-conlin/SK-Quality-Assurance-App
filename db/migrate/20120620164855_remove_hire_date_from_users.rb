class RemoveHireDateFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :hire_date
      end

  def down
    add_column :users, :hire_date, :string
  end
end
