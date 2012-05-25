class Item < ActiveRecord::Base
  attr_accessible :description, :number
  has_many :packagings
end
