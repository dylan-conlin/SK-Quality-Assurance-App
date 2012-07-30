class AddLaborCostToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :labor_cost, :decimal
  end
end
