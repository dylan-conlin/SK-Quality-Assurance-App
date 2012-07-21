class AddAttachmentAsset2ToInstances < ActiveRecord::Migration
  def self.up
    add_column :instances, :asset2_file_name, :string
    add_column :instances, :asset2_content_type, :string
    add_column :instances, :asset2_file_size, :integer
    add_column :instances, :asset2_updated_at, :datetime
  end

  def self.down
    remove_column :instances, :asset2_file_name
    remove_column :instances, :asset2_content_type
    remove_column :instances, :asset2_file_size
    remove_column :instances, :asset2_updated_at
  end
end
