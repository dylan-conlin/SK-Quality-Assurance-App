
class Nonconformance < ActiveRecord::Base
  attr_accessible :reason, :user_id, :component_id, :status, :instances_attributes, :photo_1, :photo_2, :photo_3, :photo_4, :letter, :recipient, :notification_date, :credit_number, :close_date, :days_until_due

before_create :set_status, :set_labor_cost, :set_letter, :set_days_until_due


scope :open, where(:status => "Open")
scope :waiting_on_supplier, where(:status => "Waiting on Supplier")
 scope :recent, lambda { where('notification_date >= ?', Time.current - 1.week) }
 scope :overdue, lambda { where('notification_date < ?', Time.current - 1.week) }
scope :closed, where(:status => "Closed")

belongs_to :supplier
belongs_to :user
belongs_to :component
has_many :instances, dependent: :destroy
accepts_nested_attributes_for :instances, allow_destroy: true

  validates :reason, :presence => true

  has_attached_file :photo_1,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :photo_2,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :photo_3,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }

  has_attached_file :photo_4,
     :styles => { :small => "75x75#" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }






private
    def set_status
      self.status = "Open"
    end

    def set_days_until_due
      self.days_until_due = 7
    end

    def set_labor_cost
      self.labor_cost = 15.2
    end
    
    def set_letter
      self.letter = "SK Food Group holds non-conforming product for 7 days. If you are unable to identify the cause of this non-conformance within this time, please request an extension with a timeline detailing when we are to return, donate, or dispose of the non-conforming product. We will work closely with you to resolve non-conformances as our goal is to close and dispose of all non-conformances within 10 days. Upon request, we will send samples of non-conforming product. Please send the ship-to address, quantity requested, a FedEx or UPS number against which we can charge freight, and any preparation instructions. We will make every attempt to ship product in its normal storage state. If the non-conforming product was moved to another state prior to discovery, we will ship in the new state unless instructed otherwise. We calculate credit for non-conforming product to include the following costs: Product; sample shipment materials (shipping containers, blue/dry ice, etc); rework and/or inspection; and disposal and storage (if volume requires). We prefer to take credit against open payables already in our system. Please proved a credit number we can use to reference the credit."
    end
end
