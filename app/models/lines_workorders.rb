class LinesWorkorders < ActiveRecord::Base
  attr_accessible :line_id, :workorder_id

  belongs_to :line
  belongs_to :workorder

end
