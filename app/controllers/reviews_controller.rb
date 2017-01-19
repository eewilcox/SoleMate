require 'pry'

class ReviewsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:id])
    @reviews = @shoe.reviews
  end

  def new
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.new
  end

  def create
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.new(review_params)
    @review.shoe = @shoe
    if @review.save
      flash[:notice] =  "Review added successfully"
      redirect_to @shoe
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to @shoe
    end
  end

  def destroy
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.find(params[:format])
    @review.destroy
    redirect_to @shoe
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :review)
  end

end
