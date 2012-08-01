class AddSupplierLotAndPoNumberAndReceiptDateToInstances < ActiveRecord::Migration
  def change
    add_column :instances, :supplier_lot, :string
    add_column :instances, :po_number, :string
    add_column :instances, :receipt_date, :date
  end
end
