class AddTunnelTemperatureTimeAndSanitizerTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :tunnel_temperature_time, :datetime
    add_column :audits, :sanitizer_time, :datetime

  end
end
