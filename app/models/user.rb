# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates_confirmation_of :password
  validates :dob, presence: true

  has_many :transactions, dependent: :destroy
  has_many :loyalty_points, dependent: :destroy

  has_many :user_rewards, dependent: :destroy
  has_many :loyalty_rewards, through: :user_rewards

  scope :today_birthday, -> { where("EXTRACT(month FROM dob) = ? AND EXTRACT(day FROM dob) = ?", Date.today.month, Date.today.day) }

  scope :today_birthday, -> { where("EXTRACT(month FROM dob) = ? AND EXTRACT(day FROM dob) = ?", Date.today.month, Date.today.day) }

  enum customer_tier: %i(standard gold platinum), _suffix: true

  def reward_user(reward_type)
    user_rewards.create(loyalty_reward: LoyaltyReward.send(reward_type))
  end

  def rewarded_with?(reward_type)
    user_rewards.where(loyalty_reward: LoyaltyReward.send(reward_type)).any?
  end
end
