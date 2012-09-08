class Workorder < ActiveRecord::Base
  attr_accessible :amount_produced, :item_id, :line_id, :notes, :number, :scheduled_quantity, :scheduled_run_date, :special_equipment, :start_time, :status

  belongs_to :item
  belongs_to :line
  
  has_many :waste_captures
  acts_as_list

end
