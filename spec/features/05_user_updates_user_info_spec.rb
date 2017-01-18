require 'rails_helper'

feature 'user signs updates user info', %Q{
  As a user I want to be able to update my email address, my password,  and delete my account
} do

# Acceptance Criteria
# * If I update my email I should be told the change was successful
# * If I update my password I should be told the change was successful
# * I can delete my account


  scenario 'an already authenticated user can change their email' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    click_link 'Change My User Info'

    fill_in 'Email', with: "new@email.com"
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'an already authenticated user can change their password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    click_link 'Change My User Info'

    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'an already authenticated user can delete their account' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    click_link 'Change My User Info'
    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end

end
