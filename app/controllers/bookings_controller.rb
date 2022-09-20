class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    if @booking.save
      redirect_to listing_bookings_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    @listing = Listing.find(params[:listing_id])
    # @listing = Listing.find(params[:listing_id])
    redirect_to listing_bookings_path(@listing), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
