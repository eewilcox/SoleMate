require 'rails_helper'

# [] Visiting the `/shoes/1/reviews/new` should display a form for creating a new review for a shoe with ID = 1.
# [] A review should validate must contain the following:
#   [] A rating between 1 and 5, inclusive
#   [] This should be a whole number
#   [] A review body of text

# feature "visitors can add reviews for shoes" do
#   scenario "adds a review for a shoe successfully" do
#     user = FactoryGirl.create(:user)
#
#     visit root_path
#     click_link 'Sign In'
#     fill_in 'Email', with: user.email
#     fill_in 'user_password', with: user.password
#     click_button 'Sign In'
#
#     click_button "Add New Shoe"
#     fill_in 'Brand', with: "Adidas"
#     fill_in 'Model', with: "Kobe"
#     fill_in 'Version', with: "2"
#     fill_in 'Picture', with: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg"
#     fill_in 'Year', with: '2000'
#     fill_in 'Price', with: 125
#     fill_in 'Description', with: "This shoe sucks"
#
#     click_button 'Add Shoe'
#     #click_link '#{shoe.brand} #{shoe.model} #{shoe.version}'
#
#     fill_in 'Rating', with: 1
#     fill_in 'Review', with: "Bad shoe"
#
#     click_button 'Add Review'
#
#     expect(page).to have_content "Kobe 2"
#     expect(page).to have_content "1"
#     expect(page).to have_content "This shoe sucks"
#   end
#
#   scenario "adds a review for a shoe unsuccessfully" do
#     user = FactoryGirl.create(:user)
#     kobe_two = Shoe.create(model: "Kobe", version: "2", brand: "Adidas", picture: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg", year: "2000", price: 125, description: "This shoe sucks", user_id: user)
#     review_for_kobe_two = Review.create(rating: 1, description: "Bad shoe", shoe_id: kobe_two)
#
#     visit new_shoe_reviews_path(kobe_two)
#
#     fill_in 'Rating', with: review_for_kobe_two.rating
#     fill_in 'Review', with: review_for_kobe_two.description
#
#     click_button "Add Review"
#
#     expect(page).to have_content "Description can't be blank"
#     expect(page).to have_content "Rating must be between 1 - 5"
#   end
# end
