class AddCreditNumberToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :credit_number, :string
  end
end
