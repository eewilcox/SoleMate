require 'rails_helper'

# [] A shoe can have many reviews. Each review must contain the following:
#   [] A rating
#   [] A body
#   [] A timestamp for when it was created
# [] Visiting the `/shoes/1` path should also include all reviews for a shoe with ID = 1.

feature "visitor sees list of reviews on shoe page" do
  scenario "sees reviews for specific shoe" do
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks")
    review_for_kobe_two = Review.create(rating: 1, description: "Bad shoe", shoe: kobe_two)

    visit shoe_path(kobe_two)

    expect(page).to have_content kobe_two.model
    expect(page).to have_content review_for_kobe_two.rating
    expect(page).to have_content review_for_kobe_two.description
  end

  scenario "does not see other reviews for other shoes" do
    kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks")
    jordan = Shoe.create(model: "Air Jordan", version: "2", brand: "Nike", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks")
    review_for_kobe_two = Review.create(rating: 3, description: "Ugly shoe", shoe: kobe_two)
    review_for_jordan = Review.create(rating: 5, description: "Nice shoe", shoe: jordan)

    visit shoe_path(jordan)

    expect(page).to have_content jordan.model
    expect(page).to have_content review_for_jordan.description

    expect(page).not_to have_content kobe_two.model
    expect(page).not_to have_content review_for_kobe_two.rating
    expect(page).not_to have_content review_for_kobe_two.description
  end
end
