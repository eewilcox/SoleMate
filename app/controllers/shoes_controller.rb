class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
    if params[:search]
      @shoes = Shoe.search(params[:search]).order("created_at DESC")
    else
      @shoes = Shoe.all.order("created_at DESC")
    end
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

  def edit
    @shoe = Shoe.find(params[:id])
    if @shoe.user != current_user
      flash[:notice] =  "Only shoe owner can update shoe information"
      redirect_to shoe_path(@shoe)
    end
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.user == current_user && @shoe.update(shoe_params)
      flash[:notice] =  "Shoe updated successfully"
      redirect_to shoe_path(@shoe)
    else
      flash.now[:notice] = @shoe.errors.full_messages
      render :edit
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    if @shoe.user == current_user
      @shoe.reviews.destroy_all
      @shoe.destroy
      redirect_to shoes_path
    else
      flash[:notice] =  "Only shoe owner can delete shoe"
      redirect_to shoe_path(@shoe)
    end
  end

  private

  def shoe_params
    params.require(:shoe).permit(:brand, :model, :version, :picture, :year, :price, :description)
  end

end
