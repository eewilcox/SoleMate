require 'rails_helper'

feature "Admin sees a list of users for SoleMate" do
  let (:user) { FactoryGirl.create(:user) }
  let (:user1) { FactoryGirl.create(:user) }

  scenario "sees link to list of users " do

    user.admin = true
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoes_path

    expect(page).to have_link "List of Users"

  end

  scenario "A non admin cannot see the link to list of users" do


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoes_path

    expect(page).to_not have_link "List of Users"
  end

  scenario "Admin sees list of users " do
    user.admin = true
    user.save
    user1

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoes_path

    click_link 'List of Users'
    
    expect(page).to have_content user1.username

  end
end
