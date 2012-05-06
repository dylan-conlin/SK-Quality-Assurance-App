class CreateTunneltemps < ActiveRecord::Migration
  def change
    create_table :tunneltemps do |t|
      t.integer :user_id
      t.string :tunnel
      t.string :item
      t.decimal :temperature
      t.text :description

      t.timestamps
    end
  end
end
