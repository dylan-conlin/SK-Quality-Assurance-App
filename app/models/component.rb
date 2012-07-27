class Component < ActiveRecord::Base
  attr_accessible :minimum_po_quantity, :number, :price_per_purchase_unit, :price_per_stock_unit, :pur_stk_conversion, :purchase_unit, :sk_description, :status, :stock_unit, :supplier_id, :supplier_number, :supplier_description

belongs_to :supplier
has_many :nonconformances

end
