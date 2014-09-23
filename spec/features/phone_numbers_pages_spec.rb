require 'rails_helper'

describe "creating a new number process" do
	it 'solidifies a new number with a confirmation message' do
		visit '/sessions/new'
	    user = User.create(:email => 'user@me.com', :password => 'password')
	    fill_in 'Email', :with => 'user@me.com'
	    fill_in 'Password', :with => 'password'
	    click_button 'Submit'
	    click_link 'Add Caller'
	    visit '/phone_numbers/new'
	    fill_in 'Number', :with => '3132124567'
	    click_button 'Submit'
	    expect(page).to have_content 'The number has been logged.'
	end

	it 'returns an error message when a number is entered incorrectly' do
		visit '/sessions/new'
	    user = User.create(:email => 'user@me.com', :password => 'password')
	    fill_in 'Email', :with => 'user@me.com'
	    fill_in 'Password', :with => 'password'
	    click_button 'Submit'
	    click_link 'Add Caller'
	    visit '/phone_numbers/new'
	    fill_in 'Number', :with => 'r56'
	    click_button 'Submit'
	    expect(page).to have_content 'Number is not a number 
	    							  Number is the wrong length (should be 10 characters)'
	end
end