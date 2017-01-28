class HomeController < ApplicationController
  def top
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user)
    @articles = Article.page(params[:page]).per(10).order(created_at: :desc)
  end
end
