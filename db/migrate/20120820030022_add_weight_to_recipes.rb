class AddWeightToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :weight, :decimal
  end
end
