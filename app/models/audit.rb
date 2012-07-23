class Audit < ActiveRecord::Base
  attr_accessible :cutting_tools, :data_collection, :dishwasher, :metal_detection, :mps, :sanitizer, :tunnel_temperature, :user_id, :dishwasher_time, :cutting_tools_time, :tunnel_temperature_time, :sanitizer_time, :data_collection_time, :mps_time, :metal_detection_time

belongs_to :user

include PgSearch

pg_search_scope :search,

                  :against => [
                  :created_at,
                  :dishwasher, 
                  :cutting_tools,
                  :tunnel_temperature,
                  :sanitizer,
                  :data_collection,
                  :mps,
                  :metal_detection
                              ],

                  :associated_against => {
                  :user               => [:name]

             } 

def self.text_search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end


end
