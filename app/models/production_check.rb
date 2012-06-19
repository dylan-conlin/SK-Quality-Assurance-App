class ProductionCheck < ActiveRecord::Base
  attr_accessible :build_accuracy, :comments, :label_accuracy, :label_readability, :seal_integrity, :user_id, :workorder

  belongs_to :user

 validates :user_id, :workorder, :presence => true
include PgSearch

pg_search_scope :search,

                :against => [

                  :comments,
                  :workorder],

                :associated_against => {
                  :user               => :name

             } 

def self.text_search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end

before_save :strip_spaces

private

 def strip_spaces
   workorder.gsub!(" ", "")
 end

end
