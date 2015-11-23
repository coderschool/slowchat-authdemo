class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p "HELLLLLOOOO"
    @user = User.new(user_params)
    p @user
    if @user.save
      # We will do something here
      flash[:notice] = "Successfully logged in!"
      redirect_to '/'
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
