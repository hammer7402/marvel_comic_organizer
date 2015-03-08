class ComicsController < ApplicationController
  before_action :authenticate_user

  def comics
    # binding.pry
    $id = session[:user_id]
  end

end
