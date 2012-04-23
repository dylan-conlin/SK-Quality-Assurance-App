class CreatePackagings < ActiveRecord::Migration
  def change
    create_table :packagings do |t|
      t.integer :user_id
      t.integer :workorder
      t.integer :item_number
      t.boolean :individual_label_placement
      t.boolean :individual_label_legibility
      t.boolean :individual_seal_integrity
      t.boolean :individual_label_accuracy
      t.boolean :individual_general_appearance
      t.boolean :master_label_placement
      t.boolean :master_label_legibility
      t.boolean :master_tape_glue
      t.boolean :master_case_appearance
      t.integer :case_count
      t.decimal :case_weight
      t.text :comments

      t.timestamps
    end
  end
end
