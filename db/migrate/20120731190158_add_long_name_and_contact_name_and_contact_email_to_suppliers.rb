class AddLongNameAndContactNameAndContactEmailToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :long_name, :string
    add_column :suppliers, :contact_name, :string
    add_column :suppliers, :contact_email, :string
  end
end
