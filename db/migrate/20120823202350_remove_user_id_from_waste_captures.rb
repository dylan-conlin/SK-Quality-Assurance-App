class RemoveUserIdFromWasteCaptures < ActiveRecord::Migration
  def up
    remove_column :waste_captures, :user_id
      end

  def down
    add_column :waste_captures, :user_id, :integer
  end
end
