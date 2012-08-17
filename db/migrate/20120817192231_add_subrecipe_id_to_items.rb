class AddSubrecipeIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :subrecipe_id, :integer
  end
end
