class WelcomesController < ApplicationController
  def show
    @name = params[:name]
  end  
end
