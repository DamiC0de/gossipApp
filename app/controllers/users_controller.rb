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

  def show
    @user = User.find(session[:user_id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to @user
    else
      flash.now[:alert] = "User update failed"
      render :edit
    end
  end
  
  
  
  private
  
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :age, :description) 
  end
  
end
