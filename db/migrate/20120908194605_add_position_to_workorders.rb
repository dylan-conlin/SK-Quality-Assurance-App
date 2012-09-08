class AddPositionToWorkorders < ActiveRecord::Migration
  def change
    add_column :workorders, :position, :integer
  end
end
