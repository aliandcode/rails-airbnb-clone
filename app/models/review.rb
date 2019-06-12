class Review < ApplicationRecord
  belongs_to :booking
  validates :stars, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
