class Nonconformance < ActiveRecord::Base
  attr_accessible :reason, :user_id, :item_id, :status, :instances_attributes
  before_create :set_status

scope :open, where(:status => "Open")
scope :in_process, where(:status => "In Process")


belongs_to :user
belongs_to :item
has_many :instances, dependent: :destroy

accepts_nested_attributes_for :instances

private
    def set_status
      self.status = "Open"
    end
end
