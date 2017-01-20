require "rails_helper"

  # [] As an authenticated user
  # [] I want to destroy a review in which I'm the owner

feature "authenticated user can delete a shoe that they've created" do
  scenario "authenticated user destroys shoe successfully" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_link 'Delete'

    expect(page).to have_content shoe.brand
    expect(page).to_not have_content review.description
  end

  scenario "unauthenticated user unable to destroy review" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit shoe_path(shoe)

    expect(page).to_not have_link 'Delete'
  end

  scenario "authenticated user unable to destroy shoe because they are not the owner" do
    review_owner = FactoryGirl.create(:user)
    signed_in_user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: review_owner)
    review = FactoryGirl.create(:review, shoe: shoe, user: review_owner)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: signed_in_user.email
    fill_in 'user_password', with: signed_in_user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    expect(page).to_not have_link 'Delete'
  end
end
