class RemoveWorkorderFromWasteCaptures < ActiveRecord::Migration
  def up
    remove_column :waste_captures, :workorder
      end

  def down
    add_column :waste_captures, :workorder, :string
  end
end
