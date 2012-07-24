class AddMapAndMapTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :map, :string
    add_column :audits, :map_time, :datetime
  end
end
