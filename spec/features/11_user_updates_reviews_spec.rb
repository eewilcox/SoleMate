require "rails_helper"

  # [] As an authenticated user
  # [] I want to update reviews in which I'm the owner
  # [] So that I can correct errors or provide new information

feature "authenticated user can update review information" do
  scenario "authenticated user updates review successfully" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)
    click_link 'Update Review'

    fill_in 'Review', with: 'This is an updated description'
    click_button 'Update Review'

    expect(page).to have_content 'This is an updated description'

  end

  scenario "authenticated user is unable to update review due to bad data input" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)
    click_link 'Update Review'

    fill_in 'Rating', with: 6
    click_button 'Update Review'

    expect(page).to have_content "Rating must be between 1 - 5"
    expect(page).to have_content "Update Review Form"

  end

  scenario 'an unauthenticated user cannot navigate to a review edit page (they will be redirected to sign in page)' do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit edit_shoe_review_path(shoe, review)

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('Update')
    expect(page).to_not have_content('Cancel my account')
  end

  scenario 'an authenticated user that is not the owner of a review cannot navigate to a review edit page (they will be redirected to that shoe showpage)' do
    review_owner = FactoryGirl.create(:user)
    signed_in_user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: review_owner)
    review = FactoryGirl.create(:review, shoe: shoe, user: review_owner)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: signed_in_user.email
    fill_in 'user_password', with: signed_in_user.password
    click_button 'Sign In'

    visit edit_shoe_review_path(shoe, review)

    expect(page).to have_content('Only review owner can update review information')
    expect(page).to_not have_content('Update Review Form')
    expect(page).to_not have_link ('Update Review')
  end
end
