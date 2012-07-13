class CreateNonconformances < ActiveRecord::Migration
  def change
    create_table :nonconformances do |t|
      t.integer :user_id
      t.text :reason

      t.timestamps
    end
  end
end
