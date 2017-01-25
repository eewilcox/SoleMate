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
    @change = 0
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
        poll = poll ? "false" : "true"
        redirect_to vote_review_path(@review, poll: poll)
        return
      else
        @vote.poll = poll
        @change = 1
      end
    else
      @vote = Vote.new
      @vote.poll = params[:poll]
      @vote.review = @review
      @vote.user = current_user
    end
    if @vote.save
      flash[:notice] =  "Vote added successfully"
      redirect_to vote_review_path(@review, poll: @vote.poll, change: @change)
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to @review.shoe
    end
  end

end
