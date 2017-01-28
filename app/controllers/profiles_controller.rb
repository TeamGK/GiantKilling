class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show]

  def show
    # @user = User.profile
    # @user.profile_id = @user.id
    # @user = User.find(Profile.find(params[:id]).user_id)
    # @profile.user_id = current_user.id
    # @profiles = @profile.user
  end

  # def new
  #   @profile = Profile.new
  # end

  def index
    @profiles = Profile.all
  end

  # def create
  #   #binding.pry
  #   @profile = Profile.new(profile_params)
  #   @profile.user_id = current_user.id
  #   if @profile.save
  #     redirect_to profile_path(@profile.id), notice: "登録しました"
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = User.find(@profile.user_id)
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.id), notice: "登録を更新しました"
    else
      render :edit
    end
  end

  def search
    @q = Profile.search(params[:q])
    @profiles = @q.result(distinct: true)
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:age, :sex, :job, :hobby, :name, :height, :weight, :introduction, :user_id)
    end


end
