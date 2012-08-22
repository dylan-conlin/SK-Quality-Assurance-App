class Booking < ActiveRecord::Base
  attr_accessible :comments, :end_date, :line_id, :start_date, :workorder_id

  belongs_to :line
  belongs_to :workorder

end
