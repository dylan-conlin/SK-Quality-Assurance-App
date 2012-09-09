class ProgressReport < ActiveRecord::Base
  attr_accessible :notes, :quantity, :user_id, :workorder_id

  belongs_to :workorder
  


end
