require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should ensure_length_of(:password).is_at_most(25) }
end
