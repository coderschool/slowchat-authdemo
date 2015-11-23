class SessionsController < ApplicationController
  def new
    @error = params[:error].present?
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to messages_path
    else
      redirect_to login_path(error: true)
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  
end
