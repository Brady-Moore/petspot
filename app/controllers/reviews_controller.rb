class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @location = Location.find(params[:location_id])
    @review.location = @location
    if @review.save
      redirects_to location_path(@location)
    else
      render 'new', status: :unprocessable_content
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:location_id, :user_id, :rating, :body)
  end
end
