class DroidsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @droids = Droid.all
  end

  def show
    @droid = Droid.find(params[:id])
  end

  def new
    @droid = Droid.new
  end

  def create
    @droid = Droid.new(droid_params)
    @droid.user = current_user
    if @droid.save!
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def droid_params
    params.require(:droid).permit(:name, :address, :description, :price, :photo)
  end
end
