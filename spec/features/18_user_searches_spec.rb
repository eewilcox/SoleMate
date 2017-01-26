require 'rails_helper'

# Searching for a model that exists returns a result.
# Searching for a brand that exisits returns a result.
# Searching for something that exists returns no results.

feature "Visitor searches for a shoe" do
  scenario "vistor searches for a specific model" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

    visit root_path

    fill_in 'Search Shoes', :with => 'Kobe'
    click_button 'Search'

    expect(page).to have_content "Kobe"
    expect(page).to have_button "Add New Shoe"
    expect(page).to have_link "Adidas Kobe 2"
  end

  scenario "Visitor searches for a specific brand" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

    visit root_path

    fill_in 'Search Shoes', :with => 'Adidas'
    click_button 'Search'

    expect(page).to have_content "Kobe"
    expect(page).to have_button "Add New Shoe"
    expect(page).to have_link "Adidas Kobe 2"
  end

  scenario "Visitor searches for a brand or model that does not exist" do
    user = FactoryGirl.create(:user)
    shoe = FactoryGirl.create(:shoe, user: user)
    user.admin = false
    user.save

    visit root_path

    fill_in 'Search Shoes', :with => 'Nike'
    click_button 'Search'

    expect(page).to_not have_content "Kobe"
    expect(page).to have_button "Add New Shoe"
    expect(page).to_not have_link "Adidas Kobe 2"
  end
end
