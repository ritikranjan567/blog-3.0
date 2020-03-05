class ArticlesController < ApplicationController
    before_action :if_not_authenticated
    def index
      @articles = Article.all
    end
    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      if @article.save
        flash[:notice] = "Article sucessfully created"
        redirect_to @article
      else
        render 'new'
      end
    end

    def edit
      @article = Article.find(params[:id])  
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Successfully Updated"
        redirect_to @article
      else
        render 'edit'
      end  
    end

    def show
      @article = Article.find(params[:id])
    end
    
    
    private
    def article_params
      params.require(:article).permit(:title, :content, :bgcolor, :text_color)
    end
end
