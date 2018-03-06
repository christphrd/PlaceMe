class PlacesController < ApplicationController
  def new
    @places = []
    4.times do
      @places << Place.new
    end
  end

  def create
    #code
  end
end
