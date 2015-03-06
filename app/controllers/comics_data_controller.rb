class ComicsDataController < ApplicationController

  def index
    @comics = Comic.all
    render json: @comics
  end

end
