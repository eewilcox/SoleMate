require 'rails_helper'

feature "visitor adds a review to shoe page" do
  scenario "allows authenticated user to add a review" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)

   visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

   visit shoe_path(shoe)

   fill_in 'Rating', with: 1
    fill_in 'Review', with: "Bad shoe"

   click_button 'Add Review'

   expect(page).to have_content "Kobe 2"
    expect(page).to have_content "1"
    expect(page).to have_content "Bad shoe"
  end

 scenario "does not allow a user to save a review with invalid data" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)

   visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

   visit shoe_path(shoe)


   fill_in 'Rating', with: 8
    fill_in 'Review', with: "Bad shoe"

   click_button 'Add Review'

   expect(page).to_not have_content "Bad shoe"
    expect(page).to_not have_content "8"
    expect(page).to have_content "Rating must be between 1 - 5"
  end

 scenario 'an unauthenticated user cannot add a review, they are redirected to the sign in page' do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

   visit shoe_path(shoe)

   expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('Review added successfully')
 end
end
