# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoyaltyReward, type: :model do
  it { should have_many(:users) }
  it { should have_many(:user_rewards).dependent(:destroy) }

  it { should validate_inclusion_of(:reward_type).in_array(LoyaltyReward::REWARD_TYPE) }

  describe '.coffee_reward' do
    context 'when coffee_reward is not avilable' do
      it 'returns nil' do
        expect(LoyaltyReward.coffee_reward).to eq nil
      end
    end

    context 'when coffee reward is available' do
      before { create(:loyalty_reward) }

      it 'returns the coffee reward' do
        expect(LoyaltyReward.coffee_reward).not_to eq nil
      end
    end
  end

  describe '.cash_rebate' do
    context 'when cash rebate reward is not available' do
      it 'returns nil' do
        expect(LoyaltyReward.cash_rebate).to eq nil
      end
    end

    context 'when cash rebate reward is available' do
      before { create(:loyalty_reward, reward_type: "5\% Cash Rebate") }

      it 'returns the cash rebate reward' do
        expect(LoyaltyReward.cash_rebate).not_to eq nil
      end
    end
  end

  describe '.movie_ticket' do
    context 'when movie ticket reward is not available' do
      it 'returns nil' do
        expect(LoyaltyReward.movie_ticket).to eq nil
      end
    end

    context 'when movie ticket reward is available' do
      before { create(:loyalty_reward, reward_type: 'Movie Ticket') }

      it 'returns the movie ticket reward' do
        expect(LoyaltyReward.movie_ticket).not_to eq nil
      end
    end
  end

  describe '.airport_lounge_access' do
    context 'when airport lounge access reward is not available' do
      it 'returns nil' do
        expect(LoyaltyReward.airport_lounge_access).to eq nil
      end
    end

    context 'when airport lounge access is available' do
      before { create(:loyalty_reward, reward_type: '4x Airport Lounge Access') }

      it 'returns the airport lounge access reward' do
        expect(LoyaltyReward.airport_lounge_access).not_to eq nil
      end
    end
  end
end
