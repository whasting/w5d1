class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end


  def user_params
    params.require(:user).permit(:username, :password)
  end



end
