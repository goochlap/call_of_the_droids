class BookingController < ApplicationController
  before_action :find_droid, only: %i[new create]

  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.droid = @droid
    if @booking.save
      redirect_to droid_path(@droid)
    else
      render :new
    end
  end

  private

  def find_droid
    @droid = Droid.find(params[:droid_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
