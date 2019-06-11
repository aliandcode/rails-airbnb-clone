class BookingsController < ApplicationController
  # to use index at some point to show the list of booking within users view?
  # def index
  #   @booking = booking.all
  # end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @house = House.find(params[:house_id])

    @booking = Booking.new(booking_params)
    @booking.house = @house
    # does this user assignation work?
    @booking.user = current_user

    if @booking.save
      redirect_to house_booking_path(@house, @booking)
    else
      # where should I render to?
      render house_booking_path(@house, @booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :guests, :house_id, :user_id)
  end
end
