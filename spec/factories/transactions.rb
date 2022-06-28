FactoryBot.define do
  factory :transaction do
    amount { 100 }
    invoice_date { Date.today }
    foreign_country { false }
    association :user
  end
end
