require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should ensure_length_of(:password).is_at_most(25) }

  it { should have_many :phone_numbers }
  it { should have_many :confirmations }
  it { should have_many :testimonies }
end
