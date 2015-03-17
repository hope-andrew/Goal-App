FactoryGirl.define do
  factory :user do
    username "Andrew"
    password_digest BCrypt::Password.create("hopehope")
    session_token "MyString"
  end
  

end
