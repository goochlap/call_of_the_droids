class UsersController < ApplicationController
  def show
    # @bookings = Booking.where(user_id: current_user)
    @droids = current_user.droids
  end
end
