# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'asdfasdf1' }
    password_confirmation { 'asdfasdf1' }
    dob { Date.today }
  end

  trait :with_reward do
    after(:create) do |user|
      reward = create(:loyalty_reward, reward_type: 'Free Coffee')

      create(:user_reward, user: user, loyalty_reward: reward)
    end
  end
end
