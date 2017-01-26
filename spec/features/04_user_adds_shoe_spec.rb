require "rails_helper"

# [] A shoe must have a model, version, brand, picture, year, price, and description
# [] Visiting the `/shoes/new` path should display a form for creating a new shoe.
# [] When adding a new shoe, if I fill out the form correctly, I should see the page for the newly created shoe.
# [] When adding a new shoe, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add shoes" do
  scenario "visitor adds new shoe successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit new_shoe_path
    expect(page).to have_content "New Shoe Form"

    fill_in 'Model', with: "Kobe"
    fill_in 'Version', with: "2"
    fill_in 'Brand', with: "Adidas"
    fill_in 'Picture', with: "https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg"
    fill_in 'Year', with: "2000"
    fill_in 'Price', with: "126"
    fill_in 'Description', with: "This is not a particularly good shoe."

    click_button "Add Shoe"

    expect(page).to have_content "Shoe added successfully"
    expect(page).to have_content "Kobe"
    expect(page).to have_content "This is not a particularly good shoe."
  end

  scenario "visitor does not provide proper information for a shoe" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    visit new_shoe_path

    click_button "Add Shoe"
    expect(page).to have_content "Model can't be blank"
    expect(page).to have_content "Version can't be blank"
    expect(page).to have_content "Brand can't be blank"
    expect(page).to have_content "Picture can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Price can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
