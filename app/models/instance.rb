class Instance < ActiveRecord::Base
  attr_accessible :labor, :labor_units, :location, :lot, :nonconformance_id, :quantity, :sublot, :units, :user_id, :user_id, :workorder, :assets_attributes

  belongs_to :nonconformance
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets, allow_destroy: true

end
