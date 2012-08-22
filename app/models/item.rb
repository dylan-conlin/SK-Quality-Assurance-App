class Item < ActiveRecord::Base
  
  attr_accessible :description, :number, :customer_id, :subrecipe_ids, :item_ids, :component_ids, :item_type_id, :recipes_attributes, :category, :status, :case_pack, :case_weight, :case_weight_unit, :usda_bug_required, :purchase_to_stock_conversion, :purchase_unit, :stock_unit, :supplier_id


  has_many :packagings
  has_many :nonconformances

  belongs_to :supplier
  belongs_to :item_type
  belongs_to :customer
  
  has_many :workorders
  has_many :lines, :through => :workorders

  has_many :waste_captures, :through => :workorders

  
  
  has_many :recipes, dependent: :destroy
  has_many :subrecipes, :through => :recipes
  has_many :components, :through => :recipes

  accepts_nested_attributes_for :recipes, allow_destroy: true

  validates_uniqueness_of :number, :allow_blank => false

  def number_and_description
     self.number + ' ' + self.description
  end
  
end
