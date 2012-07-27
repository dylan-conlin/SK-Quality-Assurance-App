class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :number
      t.string :status
      t.string :sk_description
      t.string :supplier_number
      t.string :minimum_po_quantity
      t.string :purchase_unit
      t.string :stock_unit
      t.integer :pur_stk_conversion
      t.decimal :price_per_stock_unit
      t.decimal :price_per_purchase_unit
      t.integer :supplier_id

      t.timestamps
    end
  end
end
