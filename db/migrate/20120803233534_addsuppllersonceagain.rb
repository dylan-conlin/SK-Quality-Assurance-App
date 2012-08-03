class Addsuppllersonceagain < ActiveRecord::Migration
  def up
    create_table :suppliers do |t|
      t.string :name
      t.string :long_name
      t.string :contact_name
      t.string :contact_email
      t.timestamps
    end
  end

  def down
  end
end
