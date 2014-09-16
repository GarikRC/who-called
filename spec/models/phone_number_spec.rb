require 'rails_helper'

describe PhoneNumber do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :number }
  it { should validate_numericality_of(:number) }
  it { should ensure_length_of(:number).is_equal_to(10) }

  it { should belong_to :user }
  it { should have_many(:testimonies).dependent(:destroy) }
end
