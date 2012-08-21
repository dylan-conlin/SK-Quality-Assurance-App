class RemoveComponentIdFromWasteCaptures < ActiveRecord::Migration
  def up
    remove_column :waste_captures, :component_id
      end

  def down
    add_column :waste_captures, :component_id, :integer
  end
end
