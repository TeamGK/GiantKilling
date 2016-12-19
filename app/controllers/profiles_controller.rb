class ProfilesController < ApplicationController
  before_action :set_profile, only: [:create, :edit, :update]

  def show
    @article = Article.new
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path(@profile.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:age, :sex, :job, :hobby, :name, :height, :weight, :introduction, :user_id)
    end
end
