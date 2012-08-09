class AddCloseDateToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :close_date, :datetime
  end
end
