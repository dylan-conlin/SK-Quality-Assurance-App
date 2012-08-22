class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :workorder_id
      t.integer :line_id
      t.datetime :start_date
      t.datetime :end_date
      t.text :comments

      t.timestamps
    end
  end
end
