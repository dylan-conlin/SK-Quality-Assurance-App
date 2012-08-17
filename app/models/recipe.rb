class Recipe < ActiveRecord::Base
  attr_accessible :component_id, :item_id, :subrecipe_id

  belongs_to :subrecipe, :class_name => "Item"
  belongs_to :component, :class_name => "Item"


end
