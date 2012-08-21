class AddWorkorderIdToWasteCaptures < ActiveRecord::Migration
  def change
    add_column :waste_captures, :workorder_id, :integer
  end
end
