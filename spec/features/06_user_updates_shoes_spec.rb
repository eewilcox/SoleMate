require "rails_helper"

  # [] As an authenticated user
  # [] I want to update a shoe's information in which I'm the owner
  # [] So that I can correct errors or provide new information

feature "authenticated user can update shoe information" do
  scenario "authenticated user updates shoe successfully" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit edit_shoe_path(shoe)


    fill_in 'Brand', with: 'Nike'
    click_button 'Update Shoe'

    expect(page).to have_content "Nike"

  end

  scenario "authenticated user is unable to update shoe due to bad data input" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    visit root_path
    click_link 'Sign In'
    
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_link 'Update Shoe Information'

    fill_in 'Year', with: 'Two Thousand and Four'
    click_button 'Update Shoe'

    expect(page).to have_content "Year is the wrong length (should be 4 characters)"
    expect(page).to have_content "Year is not a number"
    expect(page).to have_content "Update Shoe Form"

  end

  scenario 'an unauthenticated user cannot navigate to a shoe edit page (they will be redirected to sign in page)' do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)

    visit edit_shoe_path(shoe)

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('Update')
    expect(page).to_not have_content('Cancel my account')
  end

  scenario 'an authenticated user that is not the owner of a shoe cannot navigate to a shoe edit page (they will be redirected to that shoe showpage)' do
    shoe_owner = FactoryGirl.create(:user)
    signed_in_user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: shoe_owner)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: signed_in_user.email
    fill_in 'user_password', with: signed_in_user.password
    click_button 'Sign In'

    visit edit_shoe_path(shoe)

    expect(page).to have_content('Only shoe owner can update shoe information')
    expect(page).to_not have_content('Update Shoe Form')
  end
end
