class Takeawayassets < ActiveRecord::Migration
  def up
    remove_column :instances, :asset_file_name
    remove_column :instances, :asset_content_type
    remove_column :instances, :asset_file_size
    remove_column :instances, :asset_updated_at

    remove_column :instances, :asset2_file_name
    remove_column :instances, :asset2_content_type
    remove_column :instances, :asset2_file_size
    remove_column :instances, :asset2_updated_at

    remove_column :instances, :asset3_file_name
    remove_column :instances, :asset3_content_type
    remove_column :instances, :asset3_file_size
    remove_column :instances, :asset3_updated_at

    remove_column :instances, :asset4_file_name
    remove_column :instances, :asset4_content_type
    remove_column :instances, :asset4_file_size
    remove_column :instances, :asset4_updated_at
  end

  def down
  end
end
