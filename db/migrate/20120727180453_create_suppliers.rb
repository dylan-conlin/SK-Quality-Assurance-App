class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :long_name
      t.string :contact_name
      t.string :contact_email
      t.timestamps
    end
  end
end
