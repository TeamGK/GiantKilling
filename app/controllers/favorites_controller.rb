class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@favorite = current_user.favorites.build(article_id: @article.id)

		if @favorite.save
			redirect_to articles_url, notice: "お気に入りに登録しました"
		else
			redirect_to articles_url, alert: "この投稿はお気に入りに登録できません"
		end
	end

	def destroy
		@favorite = current_user.favorites.find_by!(article_id: params[:article_id])
		@favorite.destroy
		redirect_to articles_url, notice: "お気に入りを解除しました"
	end
end
