class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @profile = @user.profile
    @articles = @user.articles
  end

  def favorites
  	@user = User.find(params[:id])
  end

  def follows
  	@user = User.find(params[:id])
    
  end

  def followers
  	@user = User.find(params[:id])
  end

  def search
    
  end

  def answer
    
  end
end
