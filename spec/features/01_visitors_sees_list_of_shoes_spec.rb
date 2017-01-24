require 'rails_helper'

# [] Visiting the `/shoes` path should contain a list of shoes.

feature "visitor sees a list of shoes" do
  scenario "sees a list of shoes" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit shoes_path

    expect(page).to have_content "Kobe"
    expect(page).to have_content "2"
    expect(page).to have_content "Adidas"
    expect(page).to have_css("img[src*='https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg']")
    expect(page).to have_button "Add New Shoe"
    expect(page).to have_link "Adidas Kobe 2"
  end

  scenario "clicks link and is taken to show page for given shoe" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit shoe_path(shoe)

    expect(page).to have_content "Kobe"
    expect(page).to have_content "2"
    expect(page).to have_content "Adidas"
    expect(page).to have_css("img[src*='https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg']")
    expect(page).to have_content "This is not my favorite shoe."
  end
end
