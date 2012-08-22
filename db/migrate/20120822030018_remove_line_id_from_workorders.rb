class RemoveLineIdFromWorkorders < ActiveRecord::Migration
  def up
    remove_column :workorders, :line_id
      end

  def down
    add_column :workorders, :line_id, :integer
  end
end
