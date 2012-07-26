class Item < ActiveRecord::Base
  attr_accessible :description, :number, :customer_id
  has_many :packagings
  has_many :nonconformances
  validates_uniqueness_of :number, :allow_blank => false

  
end
