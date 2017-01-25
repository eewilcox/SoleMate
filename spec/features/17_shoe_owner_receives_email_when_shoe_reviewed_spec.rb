require "rails_helper"

feature "a shoe owner recieves an email when their shoe is reviewed" do
  scenario "shoe is reviewed" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoe_path(shoe)

    fill_in "Rating", with: 3
    fill_in "Review", with: "Total garbage."
    click_button "Add Review"

    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
