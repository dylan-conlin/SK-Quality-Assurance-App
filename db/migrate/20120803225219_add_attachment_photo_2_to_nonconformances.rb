class AddAttachmentPhoto2ToNonconformances < ActiveRecord::Migration
  def self.up
    add_column :nonconformances, :photo_2_file_name, :string
    add_column :nonconformances, :photo_2_content_type, :string
    add_column :nonconformances, :photo_2_file_size, :integer
    add_column :nonconformances, :photo_2_updated_at, :datetime
  end

  def self.down
    remove_column :nonconformances, :photo_2_file_name
    remove_column :nonconformances, :photo_2_content_type
    remove_column :nonconformances, :photo_2_file_size
    remove_column :nonconformances, :photo_2_updated_at
  end
end
