class ReviewsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:shoe_id])
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
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] =  "Review added successfully"
      redirect_to @shoe
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to @shoe
    end
  end

  def edit
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:notice] =  "Only review owner can update review information"
      redirect_to shoe_path(@shoe)
    end
  end

  def update
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.find(params[:id])
    if @review.user == current_user && @review.update(review_params)
      flash[:notice] =  "Review updated successfully"
      redirect_to shoe_path(@shoe)
    else
      flash.now[:notice] = @review.errors.full_messages
      render :edit
    end
  end

  def vote
    @review = Review.find(params[:id])
    change = params[:change].to_i
    if params[:poll] == "true"
      @review.tally += 1 + change
    elsif params[:poll] == "false"
      @review.tally -= 1 + change
    end
    @review.save
    redirect_to @review.shoe
  end

  def destroy
    @shoe = Shoe.find(params[:shoe_id])
    @review = Review.find(params[:id])
    if @review.user == current_user || current_user.admin?
      @review.votes.each do |vote|
        vote.destroy
      end
      @review.destroy
      redirect_to @shoe
    else
      flash[:notice] =  "Only review owner can delete review"
      redirect_to @shoe
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :tally)
  end

end
