class Instance < ActiveRecord::Base
  attr_accessible :labor, :labor_units, :location, :lot, :nonconformance_id, :quantity, :sublot, :units, :user_id, :user_id, :workorder, :stocker_id, :supplier_lot, :po_number, :receipt_date

  #  before_create :set_receipt_date

  belongs_to :supplier
  belongs_to :nonconformance
  belongs_to :user
  belongs_to :stocker, :class_name => 'User', :foreign_key => 'stocker_id'
 
  validates :workorder, :lot, :sublot, :quantity, :location, :labor, :stocker_id, :presence => true
  
  




  private
    # def set_supplier_lot
    #   self.supplier_lot = "Pending"
    # end

    # def set_po_number
    #   self.po_number = "Pending"
    # end
    
    # def set_receipt_date
    #   self.receipt_date = Time.now
    # end

  

end
