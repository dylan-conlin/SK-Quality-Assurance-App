class AddPackagingAndPackagingTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :packaging, :string
    add_column :audits, :packaging_time, :datetime
  end
end
