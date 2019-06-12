class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    if @review.save
      redirect_to house_path(@review.booking.house)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:comment, :stars)
  end
end
