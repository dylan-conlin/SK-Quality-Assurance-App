class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :component_id
      t.integer :subrecipe_id
      t.integer :item_id

      t.timestamps
    end
  end
end
