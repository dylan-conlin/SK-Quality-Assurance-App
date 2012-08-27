class WasteCapture < ActiveRecord::Base
  attr_accessible :quantity, :item_id, :content_type, :recorded_by

  belongs_to :user
  belongs_to :workorder
  belongs_to :item

  validates :quantity, presence: true
  validates :item_id, presence: true
  validates :recorded_by, presence: true




end
