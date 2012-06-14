class CreateProductionChecks < ActiveRecord::Migration
  def change
    create_table :production_checks do |t|
      t.integer :user_id
      t.string :workorder
      t.boolean :label_readability
      t.boolean :label_accuracy
      t.boolean :seal_integrity
      t.boolean :build_accuracy
      t.text :comments

      t.timestamps
    end
  end
end
