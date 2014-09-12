require 'rails_helper'

describe Testimony do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :phone_number_id }
  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_most(1000) }
  it { should validate_presence_of :tally }

  it { should belong_to :user }
  it { should belong_to :phone_number }
  it { should have_many :confirmations }
end
