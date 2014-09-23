require 'rails_helper'

describe "signin" do
  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@me.com', :password => 'password')
    fill_in 'Email', :with => 'user@me.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Submit'
    page.should have_content 'Email or password is invalid'
  end

  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@me.com', :password => 'password')
    fill_in 'Email', :with => 'user@me.com'
    fill_in 'Password', :with => 'password'
    click_button 'Submit'
    page.should have_content 'Logged in!'
  end
end