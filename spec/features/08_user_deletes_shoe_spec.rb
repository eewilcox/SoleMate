require "rails_helper"

  # [] As an authenticated user
  # [] I want to destroy a shoe in which I'm the owner

feature "authenticated user can delete a shoe that they've created" do
  scenario "authenticated user destroys shoe successfully" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_link 'Delete Shoe'

    expect(page).to have_button 'Add New Shoe'
  end

  scenario "unauthenticated user unable to destroy shoe" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)

    visit shoe_path(shoe)

    expect(page).to_not have_link 'Delete Shoe'
  end

  scenario "authenticated user unable to destroy shoe because they are not the owner" do
    shoe_owner = FactoryGirl.create(:user)
    signed_in_user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: shoe_owner)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: signed_in_user.email
    fill_in 'user_password', with: signed_in_user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    expect(page).to_not have_link 'Delete Shoe'
  end
end
