class Department < ActiveRecord::Base

  attr_accessible :name

  has_many  :users, :dependent => :destroy
  has_many :issues
  validates :name, :presence => true,
    :length => { :maximum => 50 }

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

end
