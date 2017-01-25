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
    #from old method

    #
    render json: @review.tally
  end

end
