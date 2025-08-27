class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @location = Location.find(params[:location_id])
    @review.location = @location
    if @review.save
      redirect_to location_path(@location)
    else
      puts "FAILED"
      render 'locations/show', status: :unprocessable_content
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:location_id, :rating, :body)
  end
end
