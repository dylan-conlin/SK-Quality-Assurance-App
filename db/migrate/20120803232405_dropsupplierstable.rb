class Dropsupplierstable < ActiveRecord::Migration
  def up
    drop_table :suppliers
  end

  def down
  end
end
