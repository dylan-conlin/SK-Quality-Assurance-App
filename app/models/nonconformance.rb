
class Nonconformance < ActiveRecord::Base
  attr_accessible :reason, :user_id, :component_id, :status, :instances_attributes, :photo_1, :photo_2, :photo_3, :photo_4
  before_create :set_status, :set_labor_cost

scope :open, where(:status => "Open")
scope :in_process, where(:status => "In Process")

belongs_to :supplier
belongs_to :user
belongs_to :component
has_many :instances, dependent: :destroy
accepts_nested_attributes_for :instances, allow_destroy: true



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

    def set_labor_cost
      self.labor_cost = 15.2
    end
end
