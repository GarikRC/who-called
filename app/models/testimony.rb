class Testimony < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :phone_number_id, :presence => true
  validates :description, :presence => true
  validates_length_of :description, :maximum => 1000
  validates :description, uniqueness: { :scope => :phone_number_id }
  validates :tally, :presence => true

  belongs_to :user
  belongs_to :phone_number
  has_many :confirmations, dependent: :destroy
end
