class AddGmpAndGmpTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :gmp, :string
    add_column :audits, :gmp_time, :datetime
  end
end
