class PhoneNumber < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :number, :presence => true
  validates_length_of :number, maximum: 10
end
