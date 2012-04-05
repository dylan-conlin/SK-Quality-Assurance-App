class Department < ActiveRecord::Base

  attr_accessible :name

  has_many  :users, :dependent => :destroy

  validates :name, :presence => true,
    :length => { :maximum => 50 }

end
