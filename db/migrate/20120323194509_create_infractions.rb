class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.integer :user_id
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
