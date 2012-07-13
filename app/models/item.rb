class Item < ActiveRecord::Base
  attr_accessible :description, :number
  has_many :packagings
  has_many :nonconformances

end
