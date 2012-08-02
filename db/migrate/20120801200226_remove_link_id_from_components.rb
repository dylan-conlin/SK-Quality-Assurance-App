class RemoveLinkIdFromComponents < ActiveRecord::Migration
  def up
    remove_column :components, :link_id
      end

  def down
    add_column :components, :link_id, :integer
  end
end
