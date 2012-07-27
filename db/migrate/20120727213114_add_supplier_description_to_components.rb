class AddSupplierDescriptionToComponents < ActiveRecord::Migration
  def change
    add_column :components, :supplier_description, :string
  end
end
