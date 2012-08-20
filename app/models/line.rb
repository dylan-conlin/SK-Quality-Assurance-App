class Line < ActiveRecord::Base
  attr_accessible :description, :number

  has_many :items
  has_many :workorders

end
