class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :category, :string
    add_column :items, :status, :string
    add_column :items, :case_pack, :decimal
    add_column :items, :case_weight, :decimal
    add_column :items, :case_weight_unit, :string
    add_column :items, :usda_bug_required, :string
    add_column :items, :purchase_to_stock_conversion, :decimal
    add_column :items, :purchase_unit, :string
    add_column :items, :stock_unit, :string
    add_column :items, :supplier_id, :integer
  end
end
