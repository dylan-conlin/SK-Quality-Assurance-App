class Issue < ActiveRecord::Base
  attr_accessible :department_id, :description, :foreign_object_id, :gmp_id, :user_id, :workorder, :corrective_action, :photo

  belongs_to :user
  belongs_to :department
  belongs_to :gmp
  belongs_to :foreign_object

  validates_attachment_size :photo, :less_than => 5.megabytes

  validates :department_id, :description, :gmp_id, :user_id, :workorder, :corrective_action, :presence => true

  validates_numericality_of :workorder, :greater_than_or_equal_to => 0


  has_attached_file :photo,
     :styles => { :small => "300x300>" },
     :storage => :s3,
        :bucket => "workapp-qatech-images",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :convert_options => { :all => "-auto-orient" }




include PgSearch

pg_search_scope :search,

                  :against => [
                  :description, 
                  :corrective_action,
                  :workorder],

                  :associated_against => {
                  :user               => [:name],
                  :department         => [:name],
                  :gmp                => [:name],
                  :foreign_object     => [:name]
             } 

def self.text_search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end


end
