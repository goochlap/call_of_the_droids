class DroidsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @droids = Droid.all
  end

  def show
    @droid = Droid.find(params[:id])
  end

  def create
  end

  def new
  end
end
