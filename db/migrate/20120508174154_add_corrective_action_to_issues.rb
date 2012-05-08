class AddCorrectiveActionToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :corrective_action, :text
  end
end
