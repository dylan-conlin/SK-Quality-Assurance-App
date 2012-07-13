class DropNonconformancesTable < ActiveRecord::Migration
  def up
    drop_table :nonconformances
  end

  def down
  end
end
