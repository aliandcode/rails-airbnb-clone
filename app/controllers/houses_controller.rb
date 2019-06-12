class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @houses = House.where.not(latitude: nil, longitude: nil)

    @markers = @houses.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude
      }
    end
  end

  def show
    @house = House.find(params[:id])

    # new booking
    @booking = Booking.new

    # to be used in users controller to list all the bookings under user
    # @bookings = @house.bookings

    # @reviews = @house.bookings.reviews?
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    # still need to get the user id from somewhere..

    if @house.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  private

  def house_params
    params.require(:house).permit(:title, :description, :address, :price, :bedrooms, :capacity, :photo_cache, :photo, :category)
  end
end
