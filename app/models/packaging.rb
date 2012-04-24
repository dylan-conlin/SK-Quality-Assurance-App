class Packaging < ActiveRecord::Base
  # attr_accessible :user_id, :workorder, :item_number, :individual_label_placement, :individual_label_legibility, :individual_seal_integrity, :individual_label_accuracy, :individual_general_appearance, :master_label_placement, :master_label_legibility, :master_tape_glue, :master_case_appearance, :case_count, :case_weight, :comments

 belongs_to :user

 default_scope order: 'packagings.created_at DESC'


 validates :user_id, :presence => true
 validates :workorder, :presence => true
 validates :item_number, :presence => true
 validates :case_count, :presence => true
 validates :case_weight, :presence => true

end
