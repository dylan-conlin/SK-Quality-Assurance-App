class Line < ActiveRecord::Base
  attr_accessible :description, :number, :workorders_attributes
  
  has_many :workorders
  has_many :items, :through => :workorders

  accepts_nested_attributes_for :workorders, allow_destroy: true

end
