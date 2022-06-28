FactoryBot.define do
  factory :user do
    email    { "test@localhost.com" }
    password { "asdfasdf1" }
    password_confirmation { "asdfasdf1" }
    dob { Date.today }
  end
end
