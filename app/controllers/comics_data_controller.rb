class ComicsDataController < ApplicationController

  def index
    @comics = Comic.all
    render json: @comics
  end

  def show
    binding.pry
  end

  def create
    @user = User.find(session[:user_id])
    @bin = Bin.find_by(bin: params[:bin])
    @comic = Comic.find_by(title: params[:title])
    # binding.pry
    if @bin.nil? && !@comic.nil?
      # binding.pry
      Bin.create([
        {bin: params[:bin], user_id: @user.id}
      ])
      @bin.save
    elsif !@comic.nil?

      @bin.comics << @comic
      @bin.save
    end
    render json: @comic
  end

  def comic_params
    params.require(:comic).permit(:annihilated)
  end

end
