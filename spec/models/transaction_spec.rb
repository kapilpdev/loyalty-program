require "rails_helper"

RSpec.describe Transaction, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:transactions) { FactoryBot.create_list(:transaction, 5, user_id: user.id) }

  it "creates loyalty points to user" do
    user_loyalty_points = LoyaltyPoint.user_points(transactions.first.user)

    expect(user_loyalty_points).to equal(50)
  end
end
