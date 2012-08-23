class AddRecordedByToWasteCaptures < ActiveRecord::Migration
  def change
    add_column :waste_captures, :recorded_by, :string
  end
end
