class AddStatusToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :status, :string
  end
end
