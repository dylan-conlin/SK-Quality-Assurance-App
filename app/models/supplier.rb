class Supplier < ActiveRecord::Base
  attr_accessible :name, :long_name, :contact_name, :contact_email, :supplier_id, :link_id

  has_many :components
  has_many :nonconformances, :through => :components


 # validates_uniqueness_of :name, :allow_blank => false

end
