class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @house = House.all
  end

  def show
    @house = House.find(params[:id])
    @review = Review.new
    @reviews = @house.bookings.map { |booking| booking.review }
    @booking = Booking.new
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
