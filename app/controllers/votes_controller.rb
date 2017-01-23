require 'pry'

class VotesController < ApplicationController
  def index
    @review = Review.find(params[:id])
    @votes = @review.votes
  end

  def new
    @review = Review.find(params[:review_id])
    @vote = Vote.new
  end

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new
    @vote.poll = params[:poll]
    @vote.review = @review
    @vote.user = current_user
    if @vote.save
      flash[:notice] =  "Vote added successfully"
      redirect_to vote_review_path(@review, poll: @vote.poll)
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to @review.shoe
    end
  end

  def destroy
    # @vote = Vote.find(params[:vote_id])
    # @review = Review.find(params[:format])
    # @review.destroy
    # redirect_to @vote
  end

  private

end
