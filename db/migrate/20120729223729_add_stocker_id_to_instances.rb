class AddStockerIdToInstances < ActiveRecord::Migration
  def change
    add_column :instances, :stocker_id, :integer
  end
end
