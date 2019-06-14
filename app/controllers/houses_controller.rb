class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @houses = House.search_by_address(params[:query]).order(created_at: :desc)
    else
      @houses = House.where.not(latitude: nil, longitude: nil).order(created_at: :desc)
    end

    @markers = @houses.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude
      }
    end

    @stars_n = 0
    @stars_s = 0
  end

  def show
    @house = House.find(params[:id])
    @review = Review.new
    @reviews = @house.reviews
    @booking = Booking.new
    @booking_to_review = Booking.where(user: current_user, house: @house).last
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
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
