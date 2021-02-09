class BookingsController < ApplicationController
  before_action :find_droid, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.droid = @droid
    @booking.user = current_user
    if @booking.save!
      redirect_to new_droid_booking_path
    else
      render :new
    end
  end

  private

  def find_droid
    @droid = Droid.find(params[:droid_id]) # :droid_id => :id ?
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
