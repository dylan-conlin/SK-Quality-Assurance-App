class AddComponentIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :component_id, :integer
  end
end
