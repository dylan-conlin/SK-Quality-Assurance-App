class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |t|
      t.string :number
      t.integer :line_id
      t.integer :item_id
      t.string :status
      t.datetime :scheduled_run_date
      t.integer :scheduled_quantity
      t.integer :amount_produced
      t.datetime :start_time
      t.string :special_equipment
      t.text :notes

      t.timestamps
    end
  end
end
