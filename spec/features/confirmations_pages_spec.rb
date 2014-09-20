require 'spec_helper'

describe "adds confimations to accurate testimonies" do
  it "allows a signed-in user to upvote" do
    User.create(:email => 'test@email.com', :password => 'password')
    visit '/sessions/new'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
    @testimony = Testimony.create(:user_id => 1, :phone_number_id => 1, :description => 'Telemarketer selling refurbished hospital linens! DO NOT ANSWER.')
    visit '/phone_numbers/show'
    click_button '+'
    @testimony.tally.should eq 1
  end
end