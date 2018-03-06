class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    byebug
  end

  private

  def place_params
    params.permit(:name, :country)
  end
end
