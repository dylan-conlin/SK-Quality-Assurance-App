class RemoveImagesFromInstance < ActiveRecord::Migration
  def up
    remove_column :instances, :image_file_name
        remove_column :instances, :image_content_type
        remove_column :instances, :image_file_size
      end

  def down
    add_column :instances, :image_file_size, :integer
    add_column :instances, :image_content_type, :string
    add_column :instances, :image_file_name, :string
  end
end
