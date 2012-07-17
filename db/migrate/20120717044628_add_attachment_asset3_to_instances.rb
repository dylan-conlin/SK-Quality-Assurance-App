class AddAttachmentAsset3ToInstances < ActiveRecord::Migration
  def self.up
    add_column :instances, :asset3_file_name, :string
    add_column :instances, :asset3_content_type, :string
    add_column :instances, :asset3_file_size, :integer
    add_column :instances, :asset3_updated_at, :datetime
  end

  def self.down
    remove_column :instances, :asset3_file_name
    remove_column :instances, :asset3_content_type
    remove_column :instances, :asset3_file_size
    remove_column :instances, :asset3_updated_at
  end
end
