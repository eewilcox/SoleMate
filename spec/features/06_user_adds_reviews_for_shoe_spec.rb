require 'rails_helper'

# [] Visiting the `/shoes/1/reviews/new` should display a form for creating a new review for a shoe with ID = 1.
# [] A review should validate must contain the following:
#   [] A rating between 1 and 5, inclusive
#   [] This should be a whole number
#   [] A review body of text

feature "visitors can add reviews for shoes" do
  scenario "adds a review for a shoe successfully" do
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks")

    visit shoe_path(kobe_two)

    expect(page).to have_content "Review"

    fill_in "Rating", with: 1
    fill_in "Review", with: "This is an ugly shoe"
    click_button "Add Review"

    expect(page).to have_content 1
    expect(page).to have_content "This is an ugly shoe"
  end

  scenario "adds a review for a shoe unsuccessfully" do
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks")

    visit shoe_path(kobe_two)

    expect(page).to have_content "Review"

    fill_in "Rating", with: 8

    click_button "Add Review"

    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Rating must be between 1 - 5"
  end
end
