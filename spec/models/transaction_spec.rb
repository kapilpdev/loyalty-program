# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let!(:user) { create(:user) }
  let!(:transactions) { create_list(:transaction, 5, user_id: user.id) }

  it { should belong_to(:user).class_name('User') }

  it { is_expected.to validate_presence_of :invoice_date }

  it 'creates loyalty points to user' do
    user_loyalty_points = LoyaltyPoint.user_points(transactions.first.user)

    expect(user_loyalty_points).to equal(50)
  end
end
