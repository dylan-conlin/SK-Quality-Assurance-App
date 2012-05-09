class Tunneltemp < ActiveRecord::Base
  attr_accessible :description, :item, :temperature, :tunnel, :user_id

 validates :description, :item, :temperature, :tunnel, :user_id, :presence => true

 
  belongs_to :user

end
