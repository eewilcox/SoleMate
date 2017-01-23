require "rails_helper"

  # [] As an admin
  # [] I want to delete the information of any shoe

feature "admin can delete shoe information" do
  scenario "admin deletes shoe successfully, for which they are also the owner" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = true
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)
    click_link 'Delete Shoe'

    expect(page).to have_button 'Add New Shoe'

  end

  scenario "admin deletes shoe successfully, for which they are not the owner" do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user1)
    user.admin = true
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'


    visit shoe_path(shoe)
    click_link 'Delete Shoe'

    expect(page).to have_button 'Add New Shoe'
  end
end
