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
    if @review.save && current_user
      flash[:notice] =  "Review added successfully"
      redirect_to @shoe
    else
      flash.now[:notice] = @review.errors.full_messages
      redirect_to @shoe
    end
  end

  def destroy
    #    <%= link_to 'Delete', shoe_reviews_path(@shoe), method: :delete, data: {confirm: "Are you sure?"} %>
    @review = Review.find(params[:review_id])
    @review.destroy
    redirect_to @shoe
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
