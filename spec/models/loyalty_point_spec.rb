# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoyaltyPoint, type: :model do
  it { should belong_to(:user).class_name('User') }

  it { is_expected.to validate_presence_of :point }
end
