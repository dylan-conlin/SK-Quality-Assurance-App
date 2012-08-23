class RemoveContentTypeFromWasteCaptures < ActiveRecord::Migration
  def up
    remove_column :waste_captures, :content_type
      end

  def down
    add_column :waste_captures, :content_type, :string
  end
end
