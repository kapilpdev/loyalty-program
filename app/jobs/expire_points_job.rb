class ExpirePointsJob < ApplicationJob
  queue_as :default

  def perform
    prev_year = Date.today - 1.year

    LoyaltyPoint
      .where(created_at: prev_year.beginning_of_year..prev_year.end_of_year)
      .update_all(expired_point: true)
  end
end
