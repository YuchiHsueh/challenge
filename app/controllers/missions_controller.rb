class MissionsController < ApplicationController
  before_action :set_mission, only: %i[show edit update destroy]

  def new
    @mission = Mission.new
    @listing = Listing.find(params[:listing_id])
    @mission.listing = @listing
  end

  def create
    @mission = Mission.new(mission_params)
    @listing = Listing.find(params[:listing_id])
    @mission.listing = @listing
    if @mission.save
      redirect_to listing_missions_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @missions = Mission.all
  end

  def show
  end

  def edit
  end

  def update
    @listing = @mission.listing
    if @mission.update(mission_params)
      redirect_to listing_missions_path(@listing)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission.destroy
    @listing = Listing.find(params[:listing_id])
    # @listing = Listing.find(params[:listing_id])
    redirect_to listings_path, status: :see_other
  end

  private

  def mission_params
    params.require(:mission).permit(:price, :date, :mission_type)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
