class RemoveAncestryFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :ancestry
      end

  def down
    add_column :comments, :ancestry, :string
  end
end
