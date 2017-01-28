class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    # @profile = Profile.find(params[:id])
  	@user = User.find(params[:id])
    @profile = @user.profile
    # @profile.user_id = current_user.id
    @articles = @user.articles.page(params[:page]).per(5)
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

  # def search
  #   @q = User.search(params[:q])
  #   @users = @q.result(distinct: true)
  # end

  # def searchresult
  #   @q = User.search(params[:q])
  #   @users = @q.result(distinct: true)
  #   #@users = @q.result(distinct: true)

  #   # @sex = params[:sex]
  #   # @age = params[:age]
  #   # @results = Result.all
  #   #     @results = Kaminari.pagenate_arrey(@results).page(params[:page]).per(10)
  # end
end
