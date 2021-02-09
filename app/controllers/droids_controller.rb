class DroidsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_droid, only: %i[show destroy]

  def index
    @droids = Droid.all
  end

  def show; end

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

  def destroy
    @droid.destroy

    redirect_to users_path, notice: 'Droid was successfully Delete'
  end

  private

  def find_droid
    @droid = Droid.find(params[:id])
  end

  def droid_params
    params.require(:droid).permit(:name, :address, :description, :price, :photo)
  end
end
