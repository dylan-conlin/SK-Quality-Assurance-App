class ProductionCheck < ActiveRecord::Base
  attr_accessible :build_accuracy, :comments, :label_accuracy, :label_readability, :seal_integrity, :user_id, :workorder

  belongs_to :user

end
