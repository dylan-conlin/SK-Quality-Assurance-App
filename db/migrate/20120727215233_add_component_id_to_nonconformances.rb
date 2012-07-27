class AddComponentIdToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :component_id, :integer
  end
end
