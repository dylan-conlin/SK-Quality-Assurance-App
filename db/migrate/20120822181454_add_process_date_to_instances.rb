class AddProcessDateToInstances < ActiveRecord::Migration
  def change
    add_column :instances, :process_date, :date
  end
end
