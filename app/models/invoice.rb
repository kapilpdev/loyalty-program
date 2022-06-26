# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user

  validates :invoice_date, :amount, presence: true
end
