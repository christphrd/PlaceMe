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
      @user_place = UserPlace.find_by(user_id: @user.id, place_id: @place.id)
      byebug
      @user_place.update(user_place_params)
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

  def user_place_params

    params.permit(:future)
  end
end
