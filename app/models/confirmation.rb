class Confirmation < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :testimony_id, :presence => true

  belongs_to :testimony
  belongs_to :user

  validates :testimony_id, uniqueness: { :scope => :user_id }
end
