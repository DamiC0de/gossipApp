class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user # Assurez-vous d'avoir une méthode 'current_user' qui retourne l'utilisateur connecté

    if @gossip.save
      flash[:notice] = "Gossip successfully created"
      redirect_to root_path
    else
      flash.now[:alert] = "Gossip creation failed"
      render :new
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
