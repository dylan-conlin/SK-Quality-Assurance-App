class Line < ActiveRecord::Base
  attr_accessible :description, :number, :workorders_attributes, :workorder_ids

  
  has_many :lines_workorders
  has_many :workorders, :through => :lines_workorders


  accepts_nested_attributes_for :workorders, allow_destroy: true

end
