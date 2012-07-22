class Audit < ActiveRecord::Base
  attr_accessible :cutting_tools, :data_collection, :dishwasher, :metal_detection, :mps, :sanitizer, :tunnel_temperature, :user_id, :dishwasher_time

belongs_to :user

end
