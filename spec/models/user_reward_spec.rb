# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserReward, type: :model do
  it { should belong_to(:user).class_name('User') }
  it { should belong_to(:loyalty_reward).class_name('LoyaltyReward') }
end
