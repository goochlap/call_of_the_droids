class BookingsController < ApplicationController
  before_action :find_droid, only: %i[new create]

  def index
    @bookings = Booking.where(user_id: current_user)
    @droids = current_user.droids
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.droid = @droid
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user), notice: 'booking was successfully Delete'
  end

  private

  def find_droid
    @droid = Droid.find(params[:droid_id]) # :droid_id => :id ?
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
