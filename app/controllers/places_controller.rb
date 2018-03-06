class PlacesController < ApplicationController
  before_action :get_place, only: [:show]
  def new
    @place = Place.new
  end

  def create

    @place = Place.create(place_params)
    @user = User.find(session[:user_id])
    if @place
      @user.places << @place
      redirect_to "/home/#{@user.id}"
    else
      render :new
    end
  end

  def show
  end

  private

  def get_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.permit(:city, :country)
  end
end
