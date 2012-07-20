class ChangeDataTypeForAuditDishwasherTime < ActiveRecord::Migration
  def up
    change_table :audits do |t|
      t.change :dishwasher_time, :datetime
    end
  end

  def down
  end
end
