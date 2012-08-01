class Component < ActiveRecord::Base
  attr_accessible :minimum_po_quantity, :number, :price_per_purchase_unit, :price_per_stock_unit, :pur_stk_conversion, :purchase_unit, :sk_description, :status, :stock_unit, :supplier_number, :supplier_description, :link_id


belongs_to :supplier
belongs_to :linky_supplier, :class_name => 'Supplier', :foreign_key => 'link_id'

has_many :nonconformances
validates_uniqueness_of :number, :allow_blank => false
end
