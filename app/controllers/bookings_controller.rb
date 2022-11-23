class BookingsController < ApplicationController
  # before_action :set_bookmark, only: :destroy
  before_action :set_astroflat, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.astroflat = @astroflat
    @booking.user = current_user
    if @booking.save
      redirect_to astroflat_path(@astroflat)
    else
      @booking = Booking.new
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @booking.destroy
  #   redirect_to list_path(@booking.list), status: :see_other
  # end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def set_astroflat
    @astroflat = Astroflat.find(params[:astroflat_id])
  end
end
