# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions
    @rewards = current_user.loyalty_rewards
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to transactions_url, notice: 'Transaction successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :invoice_date, :foreign_country)
  end
end
