# frozen_string_literal: true

FactoryBot.define do
  factory :user_reward do
    association :user
    association :loyalty_reward
  end
end
