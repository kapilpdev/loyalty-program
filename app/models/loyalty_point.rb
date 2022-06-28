class LoyaltyPoint < ApplicationRecord
  belongs_to :user

  validates :point, presence: true

  default_scope -> { where(point_expired: false) }

  def self.user_points(user)
    where(user_id: user.id).sum(:point)
  end
end
