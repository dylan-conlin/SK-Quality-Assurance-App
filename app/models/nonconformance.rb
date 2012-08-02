
class Nonconformance < ActiveRecord::Base
  attr_accessible :reason, :user_id, :component_id, :status, :instances_attributes
  before_create :set_status, :set_labor_cost

scope :open, where(:status => "Open")
scope :in_process, where(:status => "In Process")

belongs_to :supplier
belongs_to :user
belongs_to :component
has_many :instances, dependent: :destroy
accepts_nested_attributes_for :instances, allow_destroy: true



private
    def set_status
      self.status = "Open"
    end

    def set_labor_cost
      self.labor_cost = 15.2
    end
end
