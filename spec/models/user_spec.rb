require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of :password_digest }
  it { should ensure_length_of(:password).is_at_most(25) }

  it { should have_many(:phone_numbers).dependent(:destroy) }
  it { should have_many(:confirmations).dependent(:destroy) }
  it { should have_many(:testimonies).dependent(:destroy) }
end
