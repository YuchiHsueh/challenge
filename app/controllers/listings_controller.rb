class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @listings = Listing.all
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update
      redirect_to listings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
