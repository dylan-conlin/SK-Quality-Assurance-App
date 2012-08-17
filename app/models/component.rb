class Component < ActiveRecord::Base
  attr_accessible :minimum_po_quantity, :number, :price_per_purchase_unit, :price_per_stock_unit, :pur_stk_conversion, :purchase_unit, :sk_description, :status, :stock_unit, :supplier_number, :supplier_description, :supplier_id, :link_id, :item_ids, :components_items

  
  belongs_to :supplier
  has_many :nonconformances
  has_many :waste_captures

  has_and_belongs_to_many :items



  validates_uniqueness_of :number, :allow_blank => false

  

end
