require 'rails_helper'

feature "visitor votes on a review" do
  scenario "allows user to upvote a review" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_button 'Upvote'

    expect(page).to have_content "Score: 1"

  end

  scenario "does not allow user to upvote a review twice" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    2.times do
      click_button 'Upvote'
    end

    expect(page).to have_content "Score: 0"
    expect(page).to_not have_content "Score: 1"

  end

  scenario "allows user to downvote a review" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_button 'Downvote'

    expect(page).to have_content "Score: -1"

  end

  scenario "allows user to change their vote" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe)
    review = FactoryGirl.create(:review, shoe: shoe, user: user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    click_button 'Upvote'
    click_button 'Downvote'

    expect(page).to have_content "Score: -1"
    expect(page).to_not have_content "Score: 1"

  end
end
