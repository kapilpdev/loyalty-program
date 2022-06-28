# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user

  validates :invoice_date, :amount, presence: true

  default_scope -> { order("created_at asc") }

  scope :local_investments, -> { where(foreign_country: false) }
  scope :foreign_investments, -> { where(foreign_country: true) }

  after_create :earn_loyalty_point
  after_create :cash_rebate_reward, if: -> { check_cash_rebate }
  after_create :movie_ticket_reward, if: -> { check_movie_ticket_awarded }

  private

  def earn_loyalty_point
    return if amount < 100

    points = (amount / 100) * 10
    points *= 2 if foreign_country

    user.loyalty_points.create(point: points)
  end

  def cash_rebate_reward
    transcations_count = user.transactions.where("amount > ?", 100).count

    return if transcations_count < 10

    user.reward_user("cash_rebate")
  end

  def movie_ticket_reward
    first_transaction_date = user.transactions.first.created_at

    transcations_amout_within_60_days = Transaction.where(created_at: first_transaction_date..(first_transaction_date + 60.day)).sum(:amount)

    return if transcations_amout_within_60_days < 1000

    user.reward_user("movie_ticket")
  end

  def check_cash_rebate
    !user.rewarded_with?("cash_rebate")
  end

  def check_movie_ticket_awarded
    !user.rewarded_with?("movie_ticket")
  end
  
end
