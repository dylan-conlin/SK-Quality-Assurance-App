class Tunneltemp < ActiveRecord::Base
  attr_accessible :description, :item, :temperature, :tunnel, :user_id

  validates :item, :temperature, :tunnel, :user_id, :presence => true
  default_scope order: 'created_at DESC'
 
  belongs_to :user

end
