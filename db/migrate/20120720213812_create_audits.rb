class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.integer :user_id
      t.string :dishwasher
      t.string :cutting_tools
      t.string :tunnel_temperature
      t.string :sanitizer
      t.string :data_collection
      t.string :mps
      t.string :metal_detection

      t.timestamps
    end
  end
end
