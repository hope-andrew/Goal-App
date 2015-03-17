require 'rails_helper'

feature "has a new goal page" do
  before(:each) do
    create_users
    login_user
  end

  scenario "has a 'Create New' button on Users Show page" do
      expect(page).to have_content("Create New Goal")
  end

  scenario "goes to a new goal page" do
    click_on("Create New Goal")
    expect(page).to have_content("New Goal")
  end
end

feature "displays goal content on user page" do
  before(:each) do
    create_users
    login_user
    add_goals
  end

  scenario "display all goals to owner" do
    expect(page).to have_content("Call your mom!")
    expect(page).to have_content("Work Out!")
    expect(page).to have_content("Find a job!")
  end

  scenario "displays only public goals to non-owner" do
    click_button("Sign Out")
    login_user2
    visit user_url(User.first)
    expect(page).to have_content("Find a job!")
    expect(page).to have_content("Call your mom!")
    expect(page).to_not have_content("Work Out!")
  end
end

feature "goal can be edited" do
  before(:each) do
    create_users
    login_user
    add_goals
    click_link("Find a job!")
  end

  scenario "goal page has edit/delete goal button" do
    expect(page).to have_content("Edit Goal")
    expect(page).to have_content("Delete Goal")
  end

  scenario "goal can be updated" do
    fill_in("Content", with: "Be Homeless")
    click_button("Edit Goal")
    expect(page).to have_content("Be Homeless")
  end

  scenario "goal can be completed" do
    choose("Complete")
    click_button("Edit Goal")
    expect(page).to have_content("Finished")
  end

  scenario "goal can be updated" do
    choose("Private")
    click_button("Edit Goal")
    click_button("Sign Out")
    login_user2
    visit user_url(User.first)

    expect(page).to_not have_content("Find a job!")
  end

  scenario "goal can be deleted" do
    click_on("Delete Goal")
    expect(page).to_not have_content("Find a job!")
  end
end
