class AddLineIdToWorkorder < ActiveRecord::Migration
  def change
    add_column :workorders, :line_id, :integer
  end
end
