class AddContentTypeToWasteCaptures < ActiveRecord::Migration
  def change
    add_column :waste_captures, :content_type, :boolean
  end
end
