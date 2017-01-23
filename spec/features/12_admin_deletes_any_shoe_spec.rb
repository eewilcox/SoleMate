require "rails_helper"

  # [] As an admin
  # [] I want to delete the information of any shoe

feature "admin can delete shoe information" do
  let (:user) { FactoryGirl.create(:user) }
  let (:user1) { FactoryGirl.create(:user) }
  let (:shoe) { FactoryGirl.create(:shoe, user: user) }
  let (:shoe1) { FactoryGirl.create(:shoe, user: user1) }

  scenario "admin deletes shoe successfully, for which they are also the owner" do
    user.admin = true
    shoe
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
    user1
    user.admin = true
    user.save
    shoe1

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'


    visit shoe_path(shoe1)
    click_link 'Delete Shoe'

    expect(page).to have_button 'Add New Shoe'
  end
end
