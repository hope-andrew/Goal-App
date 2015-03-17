require 'rails_helper'

feature "goal has comments" do
  before(:each) do
    create_users
    login_user
    visit goal_url(current_user.goals.first)
  end

  scenario "comment on a goal" do
    expect(page).to have_content("Create New Comment")
  end

  scenario "add a comment" do
    click_on("Create New Comment")
    fill_in("content", :with => "Hooray!")
  end
end

feature "user has comments" do

end
