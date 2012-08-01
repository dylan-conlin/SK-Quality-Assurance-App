class AddLinkIdToComponents < ActiveRecord::Migration
  def change
    add_column :components, :link_id, :integer
  end
end
