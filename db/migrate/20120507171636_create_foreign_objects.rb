class CreateForeignObjects < ActiveRecord::Migration
  def change
    create_table :foreign_objects do |t|
      t.string :name

      t.timestamps
    end
  end
end
