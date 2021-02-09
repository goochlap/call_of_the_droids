class UsersController < ApplicationController
  def show
    @droids = current_user.droids
  end
end
