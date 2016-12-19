class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    
  end

  def favorites
  	@user = User.find(params[:id])
  end

  def followss
  	@user = User.find(params[:id])
  end

  def followews
  	@user = User.find(params[:id])
  end
end
