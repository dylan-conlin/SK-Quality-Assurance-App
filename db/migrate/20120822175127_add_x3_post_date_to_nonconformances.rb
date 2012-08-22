class AddX3PostDateToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :x3_post_date, :datetime
  end
end
