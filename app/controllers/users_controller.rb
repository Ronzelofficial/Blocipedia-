class UsersController < ApplicationController
  #   def new
  #   @user = User.new
  # end
  #
  def create
    @user = User.new(user_params)



    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.username}!"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account, try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
