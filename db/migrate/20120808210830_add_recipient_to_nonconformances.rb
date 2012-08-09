class AddRecipientToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :recipient, :string
  end
end
