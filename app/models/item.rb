class Item < ActiveRecord::Base
  attr_accessible :description, :number, :customer_id, :subrecipe_ids, :item_ids, :component_ids, :item_type_id
  has_many :packagings
  has_many :nonconformances
  belongs_to :item_type

  has_many :recipes
  has_many :subrecipes, :through => :recipes
  has_many :components, :through => :recipes



  validates_uniqueness_of :number, :allow_blank => false


  
end
