require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    # visit new user sign up page
    visit new_user_url
    expect(page).to have_content "Signup"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "password"
      click_on "Signup"
    end

    scenario "redirects to goals index page after signup" do
      expect(page).to have_content "Goals"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "test_user"
    end

    scenario "shows a logout button on the homepage after signup" do
      expect(page).to have_button("Logout")
    end
  end

  feature "logging in" do

    before(:each) do
      testy =  User.create!(username: "test_user", password: "password")
      visit new_session_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "password"
      click_on "Login"
    end

    scenario "shows username on the homepage after login" do
      expect(page).to have_content "test_user"
    end
  end

  feature "logging out" do

    before(:each) do
      testy =  User.create!(username: "test_user", password: "password")
      visit new_session_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "password"
      click_on "Login"
      click_on "Logout"
    end

    scenario "begins with a logged out state" do
      visit new_session_url
      expect(page).to have_content("Login")
    end

    scenario "user is redirected to login form" do
      expect(page).to have_content("Login")
    end

    scenario "doesn't show username on the homepage after logout" do
      expect(page).not_to have_content("test_user")
    end

  end
end
