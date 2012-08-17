class ComponentsItems < ActiveRecord::Base
  attr_accessible :component_id, :item_id, :subrecipe_id

  belongs_to :item
  belongs_to :subrecipe, :class_name => "Item"


end
