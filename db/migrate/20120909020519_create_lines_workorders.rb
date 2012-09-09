class CreateLinesWorkorders < ActiveRecord::Migration
  def change
    create_table :lines_workorders do |t|
      t.integer :line_id
      t.integer :workorder_id

      t.timestamps
    end
  end
end
