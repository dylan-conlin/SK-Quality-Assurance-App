class Nonconformance < ActiveRecord::Base
  attr_accessible :reason, :user_id, :item_id

belongs_to :user
belongs_to :item
has_many :instances

end
