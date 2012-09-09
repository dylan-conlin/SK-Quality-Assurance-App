class Workorder < ActiveRecord::Base
  attr_accessible :amount_produced, :item_id, :line_ids, :notes, :number, :scheduled_quantity, :scheduled_run_date, :special_equipment, :start_time, :status, :progress_reports_attributes

  belongs_to :item

  has_many :lines_workorders
  has_many :lines, :through => :lines_workorders 

  has_many :progress_reports

  has_many :waste_captures
  acts_as_list

  accepts_nested_attributes_for :progress_reports, :allow_destroy => true

end
