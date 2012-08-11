class AddDaysUntilDueToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :days_until_due, :integer
  end
end
