class SessionsController < ApplicationController
  def new
    # Cette action affiche le formulaire de connexion
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
  
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = "Logged out successfully"
    redirect_to root_path, turbolinks: [:force, true]
  end
end
