class RemoveCreatedAtFromComponentsItems < ActiveRecord::Migration
  def up
    remove_column :components_items, :created_at
      end

  def down
    add_column :components_items, :created_at, :datetime
  end
end
