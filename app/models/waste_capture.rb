class WasteCapture < ActiveRecord::Base
  attr_accessible :component_id, :quantity, :user_id, :workorder

  belongs_to :user
  belongs_to :component


end
