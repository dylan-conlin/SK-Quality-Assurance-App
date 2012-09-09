class CreateProgressReports < ActiveRecord::Migration
  def change
    create_table :progress_reports do |t|
      t.integer :workorder_id
      t.integer :quantity
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
  end
end
