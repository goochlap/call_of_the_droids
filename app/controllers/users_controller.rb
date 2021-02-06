class UsersController < ApplicationController
  def index
    @droids = current_user.droids
  end

  def update
  end

  def destroy
  end
end
