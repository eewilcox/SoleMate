require 'rails_helper'

feature 'sign up' , %Q{
  As an unauthenticated user I want to sign up so I can rate shoes
} do

  #Acceptance Criteria
  # * Valid email address
  # * Specify and confirm password
  # * Error if above not completed
  # * If above feilds are specified, I am an authenticated user

  scenario 'specifying valid and required information (no profile picture upload)' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Kobe'
    fill_in 'Last Name', with: 'Bryant'
    fill_in 'Username', with: 'KB'
    fill_in 'Email', with: 'kbryant@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome to SoleMate')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specifying valid and required information (profile picture uploaded)' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Kobe'
    fill_in 'Last Name', with: 'Bryant'
    fill_in 'Username', with: 'KB'
    fill_in 'Email', with: 'kbryant@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file 'Profile Picture', "#{Rails.root}/spec/support/images/dog.png"
    click_button 'Sign Up'

    expect(page).to have_content('Welcome to SoleMate')
    expect(page).to have_content('Sign Out')
    expect(page).to have_css("img[src*='dog.png']")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'


    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingDifferent'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
