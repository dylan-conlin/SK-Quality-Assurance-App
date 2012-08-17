class RemoveUpdatedAtFromComponentsItems < ActiveRecord::Migration
  def up
    remove_column :components_items, :updated_at
      end

  def down
    add_column :components_items, :updated_at, :datetime
  end
end
