class UsersController < ApplicationController
  def index
    @droids = current_user.droids
  end
end
