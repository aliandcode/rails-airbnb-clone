class Booking < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_one :review

  validates :guests, numericality: true, presence: true
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
