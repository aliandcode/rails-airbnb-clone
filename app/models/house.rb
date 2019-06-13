class House < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :bedrooms, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :capacity, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :category, inclusion: { in: ["Entire home", "Private room", "Shared room" ] }, presence: true
  validates :price, numericality: true, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_address,
  against: [ :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
