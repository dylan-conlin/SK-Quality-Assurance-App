class AddDishwasherTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :dishwasher_time, :date
  end
end
