class VotesController < ApplicationController
  def index
    @review = Review.find(params[:review_id])
    @votes = @review.votes
  end

  def new
    @review = Review.find(params[:review_id])
    @vote = Vote.new
  end

  def create
    change = 0
    @review = Review.find(params[:review_id])
    voted = Vote.where({user_id: current_user.id, review_id: params[:review_id]})
    if voted.exists?
      @vote = voted.first
      if params[:poll] == "true"
        poll = true
      elsif params[:poll] == "false"
        poll = false
      end
      if @vote.poll == poll
        @vote.destroy
        if poll == true
          @review.tally -= 1
        elsif poll == false
          @review.tally += 1
        end
        @review.save
        redirect_to @review.shoe
        return
      else
        @vote.poll = poll
        change = 1
      end
    else
      @vote = Vote.new
      @vote.poll = params[:poll]
      @vote.review = @review
      @vote.user = current_user
    end
    if @vote.save
      flash[:notice] =  "Vote added successfully"
      if params[:poll] == "true"
        @review.tally += 1 + change
      elsif params[:poll] == "false"
        @review.tally -= 1 + change
      end
      @review.save
      redirect_to @review.shoe
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to @review.shoe
    end
  end

end
