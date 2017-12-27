class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome, #{user.username}!"
      session[:user_id] = user.id      
      redirect_to user_path(user)
    else
      flash.now[:danger] = "The e-mail or password is wrong."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out"
    redirect_to root_path
  end
end