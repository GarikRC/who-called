class User < ActiveRecord::Base
  validates :email, :presence => true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create }
  validates :password, :presence => true
  validates_length_of :password, maximum: 25

  has_many :phone_numbers
  has_many :confirmations
  has_many :testimonies
end
