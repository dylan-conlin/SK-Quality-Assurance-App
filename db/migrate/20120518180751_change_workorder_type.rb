class ChangeWorkorderType < ActiveRecord::Migration
  def up
    change_column :issues, :workorder, :string
  end

  def down
    change_column :issues, :workorder, :integer
  end
end
