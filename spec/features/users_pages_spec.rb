require 'rails_helper'


describe "creating a new user process" do
	it 'solidifies a new user with a confirmation message' do
		visit '/users/new'
	    fill_in 'Email', :with => 'test@me.com'
	    fill_in 'Password', :with => 'password'
	    fill_in 'Password confirmation', :with => 'password'
	    click_button 'Sign Up'
	    expect(page).to have_content 'Thank you for signing up!'
	end

	it 'returns an error message when a user is entered incorrectly' do
		visit '/users/new'
	    fill_in 'Email', :with => 'blah'
	    fill_in 'Password', :with => 'password'
	    fill_in 'Password confirmation', :with => 'password'
	    click_button 'Sign Up'
	    expect(page).to have_content 'Email is invalid'
	end
end