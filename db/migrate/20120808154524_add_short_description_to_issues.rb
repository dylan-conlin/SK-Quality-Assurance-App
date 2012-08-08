class AddShortDescriptionToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :short_description, :string
  end
end
