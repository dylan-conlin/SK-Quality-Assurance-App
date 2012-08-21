class WasteCapture < ActiveRecord::Base
  attr_accessible :quantity, :user_id, :workorder_id, :item_id

  belongs_to :user
  belongs_to :workorder
  belongs_to :item

end
