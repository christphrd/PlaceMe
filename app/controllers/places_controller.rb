class PlacesController < ApplicationController
  def new
    @places = []
    4.times do
      @places << Place.new
    end
  end

  def create
    byebug
  end

  private

  def place_params
    params.require(:place).permit(:name, :country)
  end
end
