class Supplier < ActiveRecord::Base
  attr_accessible :name

has_many :components

  validates_uniqueness_of :name, :allow_blank => false

end
