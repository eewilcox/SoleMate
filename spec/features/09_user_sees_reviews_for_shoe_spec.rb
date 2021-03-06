require 'rails_helper'

feature "visitor sees a list of reviews for a shoe" do
  scenario "sees a list of reviews" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    expect(page).to have_content review.rating
    expect(page).to have_content review.description

  end

  scenario "does not see reviews for other shoes" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)
    shoe2 = FactoryGirl.create(:shoe)
    review = FactoryGirl.create(:review, shoe: shoe)
    review2 = FactoryGirl.create(:review, shoe: shoe2)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe2)

    expect(page).to_not have_content review.description
  end
end
