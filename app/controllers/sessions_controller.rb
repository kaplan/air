class SessionsController < ApplicationController

  # Get the user and password from the params passed through the form
  # Remember you need to authenticate the password when you create the session
  def create
    @user = User.find_by_name(params[:name])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Hello, #{@user.name}."
      return
    else
      redirect_to root_url, notice: "Incorrect username or password."
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "You are logged out."
  end
end
