class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
    @review = Review.new
    @reviews = @shoe.reviews
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user = current_user
    if @shoe.save
      flash[:notice] =  "Shoe added successfully"
      redirect_to shoe_path(@shoe)
    else
      flash.now[:notice] = @shoe.errors.full_messages
      render :new
    end
  end

  private

  def shoe_params
    params.require(:shoe).permit(:brand, :model, :version, :picture, :year, :price, :description)
  end

end
