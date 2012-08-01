class Instance < ActiveRecord::Base
  attr_accessible :labor, :labor_units, :location, :lot, :nonconformance_id, :quantity, :sublot, :units, :user_id, :user_id, :workorder, :asset, :asset2, :asset3, :asset4, :stocker_id, :supplier_lot, :po_number, :receipt_date

  belongs_to :nonconformance
  before_create :set_supplier_lot, :set_po_number
  belongs_to :user
  belongs_to :stocker, :class_name => 'User', :foreign_key => 'stocker_id'
 
  validates :workorder, :lot, :sublot, :quantity, :location, :labor, :stocker_id, :presence => true
  
  


  has_attached_file :asset,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :asset2,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :asset3,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :asset4,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }


  private
    def set_supplier_lot
      self.supplier_lot = "Pending"
    end

    def set_po_number
      self.po_number = "Pending"
    end


  

end
