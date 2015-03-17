require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
      expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in('Username', :with => 'Andrew')
      fill_in('Password', :with => 'hopehope')
      click_button('Sign Up')
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "Andrew"
    end
  end

end

feature "logging in" do
  before(:each) do
    visit new_user_url
    fill_in('Username', :with => 'Andrew')
    fill_in('Password', :with => 'hopehope')
    click_button('Sign Up')
    click_button('Sign Out')
    visit new_session_url
    fill_in('Username', :with => 'Andrew')
    fill_in('Password', :with => 'hopehope')
    click_button('Sign In')
  end
  scenario "shows username on the homepage after login" do
    expect(page).to have_content "Andrew"
  end
end

feature "logging out" do
  before(:each) do
    visit new_session_url
  end
  it "begins with logged out state" do
    expect(page).to have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).to_not have_content( "Andrew")
  end



end
