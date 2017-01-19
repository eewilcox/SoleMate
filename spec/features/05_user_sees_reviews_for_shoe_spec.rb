require 'rails_helper'

# [] A shoe can have many reviews. Each review must contain the following:
#   [] A rating
#   [] A body
#   [] A timestamp for when it was created
# [] Visiting the `/shoes/1` path should also include all reviews for a shoe with ID = 1.

feature "visitor sees list of reviews on shoe page" do
  scenario "sees reviews for specific shoe" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit new_shoe_path
    fill_in 'Brand', with: "Adidas"
    fill_in 'Model', with: "Kobe"
    fill_in 'Version', with: "2"
    fill_in 'Picture', with: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg"
    fill_in 'Year', with: '2000'
    fill_in 'Price', with: 125
    fill_in 'Description', with: "This shoe sucks"

    click_button 'Add Shoe'

    fill_in 'Rating', with: 1
    fill_in 'Review', with: "Bad shoe"

    click_button 'Add Review'

    expect(page).to have_content "Kobe 2"
    expect(page).to have_content "1"
    expect(page).to have_content "This shoe sucks"
  end

  scenario "does not see other reviews for other shoes" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit new_shoe_path
    fill_in 'Brand', with: "Adidas"
    fill_in 'Model', with: "Kobe"
    fill_in 'Version', with: "2"
    fill_in 'Picture', with: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg"
    fill_in 'Year', with: '2000'
    fill_in 'Price', with: 125
    fill_in 'Description', with: "This shoe sucks"

    click_button 'Add Shoe'

    fill_in 'Rating', with: 1
    fill_in 'Review', with: "Bad shoe"

    click_button 'Add Review'

    expect(page).to_not have_content "Air Jordan"
    expect(page).to_not have_content "4"
    expect(page).to_not have_content "This shoe is great"
  end

  scenario 'an unauthenticated user cannot navigate a shoe edit page (they will be redirected to sign in page)' do
   user = FactoryGirl.create(:user)
   shoe = FactoryGirl.create(:shoe)

   visit shoe_path(shoe)

   fill_in 'Rating', with: 5
   fill_in 'Review', with: "Good shoe"
   click_link 'Add Review'

   expect(page).to have_content('You need to sign in or sign up before continuing.')
   expect(page).to_not have_content('Review added successfully')
 end
end
