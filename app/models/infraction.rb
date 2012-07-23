class Infraction < ActiveRecord::Base

  belongs_to :user

  validates :user_id,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates :date,  presence: true

end
