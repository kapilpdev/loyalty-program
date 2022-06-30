require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_presence_of :dob }

  it { should have_many(:transactions).dependent(:destroy) }
  it { should have_many(:loyalty_points).dependent(:destroy) }
  it { should have_many(:user_rewards).dependent(:destroy) }
  it { should have_many(:loyalty_rewards) }
end
