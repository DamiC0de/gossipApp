class UsersController < ApplicationController
  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Connecte l'utilisateur juste après son inscription
      flash[:notice] = "User successfully created"
      redirect_to root_path
    else
      flash.now[:alert] = "User creation failed"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
