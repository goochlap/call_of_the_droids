class DroidsController < ApplicationController
  def index
    @droids = Droid.all
  end

  def show
  end

  def create
  end

  def new
  end
end
