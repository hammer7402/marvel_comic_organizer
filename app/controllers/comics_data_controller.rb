class ComicsDataController < ApplicationController

  def index
    @comics = Comic.all
    render json: @comics
  end

  def bins
    @bins = Bin.all
    render json: @bins
  end

  def binComic
    @comics = Bin.find(params["id"]).comics
    render json: @comics
  end

  def show
    @comics = User.find(params["id"]).comics
    render json: @comics
  end

  def create
    @user = User.find(session[:user_id])
    @bin = Bin.find_by(bin: params[:bin])
    @comic = Comic.find_by(title: params[:title])
    # binding.pry
    if @bin.nil? && !@comic.nil?
      # binding.pry
      @bin = Bin.create(
        {bin: params[:bin], user_id: @user.id}
      )
      @bin.comics << @comic
      @bin.save
    elsif !@comic.nil?

      @bin.comics << @comic
      @bin.save
    end
    render json: @comic
  end

  def destroy
    # binding.pry
    @comic = Comic.find(params[:id])
    @bin = Comic.find(params[:id]).bins.find_by(user_id: params[:user_id])
    @bin.comics.delete(@comic)
    render json: @comic
  end

  def comic_params
    params.require(:comic).permit(:annihilated)
  end

end
