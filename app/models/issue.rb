class Issue < ActiveRecord::Base
  attr_accessible :department_id, :description, :foreign_object_id, :gmp_id, :user_id, :workorder, :corrective_action, :photo

  belongs_to :user
  belongs_to :department
  belongs_to :gmp
  belongs_to :foreign_object

   validates_attachment_size :photo, :less_than => 5.megabytes

   validates :department_id, :description, :foreign_object_id, :gmp_id, :user_id, :workorder, :corrective_action, :presence => true

   validates_numericality_of :workorder, :greater_than_or_equal_to => 0



  #paperclip
  has_attached_file :photo,
       :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" },
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"





end
