require 'rails_helper'

describe Confirmation do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :testimony_id }

  it { should belong_to :testimony }
  it { should belong_to :user }
end
