class RemoveDishwasherTimeFromAudits < ActiveRecord::Migration
  def up
    remove_column :audits, :dishwasher_time
      end

  def down
    add_column :audits, :dishwasher_time, :datetime
  end
end
