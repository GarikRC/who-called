require 'rails_helper'

describe PhoneNumber do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :number }
  it { should ensure_length_of(:number).is_at_most(10) }
end
