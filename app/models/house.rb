class House < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings

  validates :bedrooms, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :capacity, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, presence: true
  validates :category, inclusion: { in: %w[Entire_home Private_room Shared_room] }, presence: true
end
