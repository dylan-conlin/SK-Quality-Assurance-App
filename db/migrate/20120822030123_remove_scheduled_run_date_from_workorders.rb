class RemoveScheduledRunDateFromWorkorders < ActiveRecord::Migration
  def up
    remove_column :workorders, :scheduled_run_date
      end

  def down
    add_column :workorders, :scheduled_run_date, :datetime
  end
end
