class ReviewsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:id])
    @reviews = @shoe.reviews
  end

  def new
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.new
    @errors = @review.errors
  end

  def create
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.new(review_params)
    @review.shoe = @shoe
    if @review.save
      redirect_to @shoe, notice: 'Review added successfully.'
    else
      @errors = @review.errors.full_messages
      redirect_to @shoe
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
