# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before :each do
    login(user)
  end

  it "redirects to the transaction's page" do
    get '/transactions'
    expect(response).to have_http_status(200)
  end

  it "creates a Transaction and redirects to the Transaction's page" do
    get '/transactions/new'

    expect(response).to have_http_status(200)

    post '/transactions', params: { transaction: { invoice_date: Date.today, amount: '500', foreign_country: '0' } }

    follow_redirect!

    expect(response).to have_http_status(200)
    expect(response.body).to include('Transaction successfully created.')
  end
end
