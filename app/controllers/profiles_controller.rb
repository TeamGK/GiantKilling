class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def show
    @user = User.find(Profile.find(params[:id]).user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    #binding.pry
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile.id), notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.id), notice: "登録を更新しました"
    else
      render :edit
    end
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:age, :sex, :job, :hobby, :name, :height, :weight, :introduction, :user_id)
    end


end
