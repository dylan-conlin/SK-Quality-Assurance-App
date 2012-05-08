class Gmp < ActiveRecord::Base
  attr_accessible :name

  has_many :issues

  validates :name, :presence => true,
    :length => { :maximum => 50 }

end
