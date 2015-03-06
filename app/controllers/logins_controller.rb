
class LoginsController < ApplicationController

  def show
    @wrong = params[:wrong]
  end

  def authenticate
    user = User.find_by({username: params[:username]})

    if user && user.authenticate(params[:password])
      # store their id in session
      session[:user_id] = user.id
      redirect_to comics_path
    else
      # rerender the form
      # redirect_to login_path
      redirect_to "/login?wrong=true"
    end

  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.save
    binding.pry
    redirect_to "/login"
  end

  def destroy
    # remove the user_id from session
    # binding.pry
    session[:user_id] = nil
    redirect_to '/login'
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
      )
  end

end
