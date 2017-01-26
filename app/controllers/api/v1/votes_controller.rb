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
    voted = Vote.where({user_id: @user, review_id: @review.id})
    if voted.exists?
      @review = vote_exists(voted, @poll, @review)
    else
      @review = new_vote(@user, @poll, @review)
    end
    @review.save
    render json: @review.tally
  end

  private

  def vote_exists(voted, poll, review)
    vote = voted.first
    if vote.poll == poll
      review = delete_vote(vote, poll, review)
    else
      review = change_vote(vote, poll, review)
    end
    return review
  end

  def delete_vote(vote, poll, review)
    vote.destroy
    if poll
      review.tally -= 1
    else
      review.tally += 1
    end
    return review
  end

  def change_vote(vote, poll, review)
    vote.poll = poll
    vote.save
    if poll
      review.tally += 2
    else
      review.tally -= 2
    end
    return review
  end

  def new_vote(user, poll, review)
    vote = Vote.new(review: review, user: user, poll: poll)
    vote.save
    if poll
      review.tally += 1
    else
      review.tally -= 1
    end
    return review
  end

end
