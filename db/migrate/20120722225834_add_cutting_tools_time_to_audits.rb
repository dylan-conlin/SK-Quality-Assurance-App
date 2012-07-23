class AddCuttingToolsTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :cutting_tools_time, :datetime
  end
end
