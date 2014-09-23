require 'rails_helper'


describe "creating a confirmation process" do
	it 'solidifies a new confirmation with an added value of 1' do
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
	    click_link '+'
	    expect(page).to have_content '1'
	end

	it 'allows only one confirmation per user' do
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
	    click_link '+'
	    click_link '+'
	    expect(page).to have_content '1'
	end
end