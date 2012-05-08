class Issue < ActiveRecord::Base
  attr_accessible :department_id, :description, :foreign_object_id, :gmp_id, :user_id, :workorder, :corrective_action

  belongs_to :user
  belongs_to :department
  belongs_to :gmp
  belongs_to :foreign_object

 validates :department_id, :description, :foreign_object_id, :gmp_id, :user_id, :workorder, :corrective_action, :presence => true

 validates_numericality_of :workorder, :greater_than_or_equal_to => 0


end
