require 'rails_helper'

# [] Visiting the `/shoes` path should contain a list of shoes.

feature "visitor sees a list of shoes" do
  scenario "sees a list of shoes" do
    user = FactoryGirl.create(:user)
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks", user_id: user.id)

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
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks", user_id: user.id)

    visit root_path
    visit shoe_path(kobe_two)

    expect(page).to have_content "Kobe"
    expect(page).to have_content "2"
    expect(page).to have_content "Adidas"
    expect(page).to have_css("img[src*='https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg']")
    expect(page).to have_content "This shoe sucks"
  end
end
