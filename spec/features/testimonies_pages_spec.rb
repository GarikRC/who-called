require 'rails_helper'


describe "creating a new testimony process" do
	it 'solidifies a new testimony with a confirmation message' do
		visit '/sessions/new'
	    user = User.create(:email => 'user@me.com', :password => 'password')
	    fill_in 'Email', :with => 'user@me.com'
	    fill_in 'Password', :with => 'password'
	    click_button 'Submit'
	    click_link 'Add Caller'
	    visit '/phone_numbers/new'
	    number = PhoneNumber.create(:number => '3132124567')
	    fill_in 'Number', :with => '3132124567'
	    click_button 'Submit'
	    click_link 'Add Testimony'
	    visit "new"
	    fill_in 'Description', :with => 'The number belongs to a telemarketer selling refurbished hospital linens. DO NOT ANSWER!'
	    click_button 'Submit'
	    expect(page).to have_content 'Testimony added!'
	end

	it 'returns an error message when a testimony is entered incorrectly' do
		visit '/sessions/new'
	    user = User.create(:email => 'user@me.com', :password => 'password')
	    fill_in 'Email', :with => 'user@me.com'
	    fill_in 'Password', :with => 'password'
	    click_button 'Submit'
	    click_link 'Add Caller'
	    visit '/phone_numbers/new'
	    number = PhoneNumber.create(:number => '3132124567')
	    fill_in 'Number', :with => '3132124567'
	    click_button 'Submit'
	    click_link 'Add Testimony'
	    visit "new"
	    fill_in 'Description', :with => ''
	    click_button 'Submit'
	    expect(page).to have_content "Description can't be blank"
	end
end