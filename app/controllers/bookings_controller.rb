class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  # to use index at some point to show the list of booking within users view?
  # def index
  #   @booking = booking.all
  # end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @house = House.find(params[:house_id])
  end

  def create
    @house = House.find(params[:house_id])

    @booking = Booking.new(booking_params)
    @booking.house = @house
    # does this user assignation work?
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save
      redirect_to house_booking_path(@house, @booking)
    else
      render :new
    end
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    @booking.save

    redirect_to dashboard_pages_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save

    redirect_to dashboard_pages_path
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :guests, :house_id, :user_id)
  end
end
