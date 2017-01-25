class Api::V1::VotesController < ApplicationController
  respond_to :json

  def index
    @review = Review.find(params["review_id"].to_i)
    render json: @review.tally
  end

  def create
    @poll = JSON.parse(request.body.read)["poll"]
    @review = Review.find(params["review_id"].to_i)
    @user = current_user
    change = 0
    voted = Vote.where({user_id: @user, review_id: @review.id})
    if voted.exists?
      @vote = voted.first
      if @vote.poll == @poll
        @vote.destroy
        if @poll == true
          @review.tally -= 1
        elsif @poll == false
          @review.tally += 1
        end
        @review.save
        render json: @review.tally
        return
      else
        @vote.poll = @poll
        change = 1
      end
    else
      @vote = Vote.new
      @vote.poll = @poll
      @vote.review = @review
      @vote.user = @user
    end
    @vote.save
    if @poll == true
      @review.tally += 1 + change
    elsif @poll == false
      @review.tally -= 1 + change
    end
    @review.save
    render json: @review.tally
  end

end
