class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :department_id
      t.integer :gmp_id
      t.integer :user_id
      t.text :description
      t.integer :workorder
      t.integer :foreign_object_id

      t.timestamps
    end
  end
end
