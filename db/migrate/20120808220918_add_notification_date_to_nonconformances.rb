class AddNotificationDateToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :notification_date, :datetime
  end
end
