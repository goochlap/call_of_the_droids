class DroidsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_droid, only: %i[show destroy]

  def index
    @droids = Droid.all

    @markers = @droids.geocoded.map do |droid|
      {
        lat: droid.latitude,
        lng: droid.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { droid: droid })
      }
    end
  end

  def show; end

  def new
    @droid = Droid.new
  end

  def create
    @droid = Droid.new(droid_params)
    @droid.user = current_user
    if @droid.save
      save_categories(@droid)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @droid.destroy

    redirect_to user_path(current_user), notice: 'Droid was successfully Delete'
  end

  private

  def find_droid
    @droid = Droid.find(params[:id])
  end

  def droid_params
    params.require(:droid).permit(:name, :address, :description, :price, :photo, :category_ids)
  end

  def save_categories(droid)
    params[:droid][:category_ids].each do |category_id|
      if category_id != ''
        # name = Category.find(category_id).name
        Category.create!(name: category_id, droid: droid)
      end
    end
  end
end
