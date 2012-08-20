class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :number
      t.string :description

      t.timestamps
    end
  end
end
