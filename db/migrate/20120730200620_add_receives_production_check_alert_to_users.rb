class AddReceivesProductionCheckAlertToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receives_production_check_alert, :boolean
  end
end
