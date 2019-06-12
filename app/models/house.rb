class House < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :bedrooms, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :capacity, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :category, inclusion: { in: %w[Entire_home Private_room Shared_room] }, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
