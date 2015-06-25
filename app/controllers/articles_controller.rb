class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :music,:ruby_programming,:linux,:travel,:movie,:ballgame]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
   if params[:search] and !params[:search].blank?
      @articles = Article.search do
       fulltext params[:search]
       paginate(:page => (params[:page] or 1), :per_page => 3)
      end.results
    
    else
      @articles = Article.order(published_at: :desc).page params[:page]
    end
   
  end
  
  include Categories
  
  # GET /articles/1
  # GET /articles/1.json
  def show
     #@article = current_user.articles.friendly.find(params[:id])
     @article = Article.friendly.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
    
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.articles.friendly.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.friendly.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article }
        format.js 
        format.json { head :ok }
        #format.json { render action: 'show', status: :created, location: @article }
        
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = current_user.articles.friendly.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_user.articles.friendly.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def categories_articles(category_id)
      articles=Article.all
      @articles=Category.find(category_id).articles(published_at: :desc).page params[:page]
      render template: "articles/shared/_index"

    end
    
    
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :location, :excerpt, :body, :published_at,:category_ids => [])
    end
end
