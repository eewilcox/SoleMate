class Api::V1::ShoesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @shoes = Shoe.all
    render json: @shoes
  end
end
