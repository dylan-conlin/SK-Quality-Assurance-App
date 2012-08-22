class Line < ActiveRecord::Base
  attr_accessible :description, :number

  has_many :items

  has_many :bookings
  has_many :workorders, :through => :bookings
  

end
