class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:article_id, :body, :user_id)
	end
end
