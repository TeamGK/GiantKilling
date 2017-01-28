class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
    @articles = Article.page(params[:page]).per(5).all.order(created_at: :desc)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @user = User.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  def registrationresult
  end

  def serach
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def result
    @sex = params[:sex]
    @age = params[:age]
    @results = Result.all
        @results = Kaminari.pagenate_arrey(@results).page(params[:page]).per(10)
  end

  def find
    @form = Serach.new
  end

  # POST /articles
  # POST /articles.json
  def create
    # @comment = Comment.new(comment_params)
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    # @articles = Article.all
    # @q = Article.ransack(params[:q])
    # @articles = @q.result(distinct: true).includes(:user)

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_url, notice: 'コーディネイト登録完了' }
        format.json { render :show, status: :created, location: @article }
      else
        @articles = Article.page(params[:page]).per(5).all
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description,:shop, :image)
    end

    def correct_user
      article = Article.find(params[:id])
      if current_user.id != article.user.id
        redirect_to root_path
      end
    end
end
