require "rails_helper"

  # [] As an admin
  # [] I want to delete the information of any review

feature "admin can delete review information" do
  scenario "admin deletes review successfully, for which they are also the owner" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)
    user.admin = true
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)
    click_link 'Delete'

    expect(page).to have_button 'Add Review'
    expect(page).to have_content shoe.brand

  end

  scenario "admin deletes review successfully, for which they are not the owner" do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user1)
    review = FactoryGirl.create(:review, shoe: shoe, user: user1)
    user.admin = true
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'


    visit shoe_path(shoe)
    click_link 'Delete'

    expect(page).to have_button 'Add Review'
    expect(page).to have_content shoe.brand
  end
end
