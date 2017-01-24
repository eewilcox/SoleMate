class Api::V1::ShoesController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def index
    @shoes = Shoe.all
    render json: @shoes
  end
end
