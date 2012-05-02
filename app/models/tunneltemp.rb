class Tunneltemp < ActiveRecord::Base
  attr_accessible :description, :item, :temperature, :tunnel, :user_id
 
  belongs_to :user

end
