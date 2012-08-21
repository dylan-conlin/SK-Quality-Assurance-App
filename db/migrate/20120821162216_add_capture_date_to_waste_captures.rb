class AddCaptureDateToWasteCaptures < ActiveRecord::Migration
  def change
    add_column :waste_captures, :capture_date, :date
  end
end
