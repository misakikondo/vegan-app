class Donate < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 500, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
                    format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  validates :token, presence: true
end
