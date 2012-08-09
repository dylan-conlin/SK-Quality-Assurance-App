class AddViewsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :views, :integer
  end
end
