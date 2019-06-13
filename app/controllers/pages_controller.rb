class PagesController < ApplicationController
  def dashboard
    @bookings = Booking.where(user: current_user)
    @houses = House.where(user: current_user)
  end
end
