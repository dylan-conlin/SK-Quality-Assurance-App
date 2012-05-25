class Packaging < ActiveRecord::Base
  # attr_accessible :user_id, :workorder, :item_number, :individual_label_placement, :individual_label_legibility, :individual_seal_integrity, :individual_label_accuracy, :individual_general_appearance, :master_label_placement, :master_label_legibility, :master_tape_glue, :master_case_appearance, :case_count, :case_weight, :comments

 belongs_to :user
 belongs_to :item
 validates :user_id, :item_id, :workorder, :case_count, :case_weight, :presence => true

 validates_numericality_of :case_count, :greater_than_or_equal_to => 0
 validates_numericality_of :case_weight, :greater_than_or_equal_to => 0
 
include PgSearch

pg_search_scope :search,

                :against => [

                  :comments,
                  :workorder],

                :associated_against => {
                  :user               => :name,
                  :item               => :number



             } 

def self.text_search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end


end
