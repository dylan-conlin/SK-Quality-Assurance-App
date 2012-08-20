class ProductionCheck < ActiveRecord::Base
  attr_accessible :build_accuracy, :comments, :label_accuracy, :label_readability, :seal_integrity, :user_id, :workorder

  belongs_to :user


 
validates :user_id, :workorder, :presence => true
include PgSearch

scope :last_3_months, lambda { where("created_at >= :date", :date => 3.months.ago) } 


def label_readability_pf
  label_readability ? 'Fail' : 'Pass'
end

def label_accuracy_pf
  label_accuracy ? 'Fail' : 'Pass'
end

def seal_integrity_pf
  seal_integrity ? 'Fail' : 'Pass'
end

def build_accuracy_pf
  build_accuracy ? 'Fail' : 'Pass'
end

def self.checks_per_wo_count
 last_3_months.group(:workorder).count
end

def self.label_readability_pass_count
  last_3_months.where(:label_readability => false).group(:workorder).count
end

def self.label_accuracy_pass_count
  last_3_months.where(:label_accuracy => false).group(:workorder).count 
end

def self.seal_integrity_pass_count
  last_3_months.where(:seal_integrity => false).group(:workorder).count 
end

def self.build_accuracy_pass_count
  last_3_months.where(:build_accuracy => false).group(:workorder).count 
end




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
