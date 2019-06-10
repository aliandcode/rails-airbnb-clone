class House < ApplicationRecord
  belongs_to :user
  has_many :bookings

  skip_before_action :authenticate_user!, only: %i[show index]
end
