class CreateGmps < ActiveRecord::Migration
  def change
    create_table :gmps do |t|
      t.string :name

      t.timestamps
    end
  end
end
