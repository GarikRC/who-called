class PhoneNumber < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :number, :presence => true
  validates_numericality_of :number
  validates :number, length: { is: 10 }

  belongs_to :user
  has_many :testimonies
end
