module AuthFeaturesHelper

  def login_user
    visit new_session_url
    fill_in('Username', with: "Kevin")
    fill_in('Password', with: "123456")
    click_on('Sign In')
  end

  def login_user2
    visit new_session_url
    fill_in('Username', with: "Anne")
    fill_in('Password', with: "123456")
    click_on('Sign In')
  end

  def create_users
    user1 = User.create(username: "Kevin", password: "123456")
    user2 = User.create(username: "Anne", password: "123456")
  end
end
