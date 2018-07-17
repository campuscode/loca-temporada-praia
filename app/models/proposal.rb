class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user
  
  enum status: [:pendent, :approved, :declined] 


  validates :start_date, :end_date, :total_guests, :rent_purpose,
            presence: { message: 'não pode ficar em branco' }
end
