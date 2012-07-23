class AddDataCollectionTimeAndMpsTimeAndMetalDetectionTimeToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :data_collection_time, :datetime
    add_column :audits, :mps_time, :datetime
    add_column :audits, :metal_detection_time, :datetime
  end
end
