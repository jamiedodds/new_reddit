class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	
	## the below allows non sined in users to the noted pages
	before_action :authenticate_user!, except: [:index, :show]

	def index
    	@articles = Article.all
  	end

	def show
    	@article = Article.find(params[:id])
  	end

  	def new
	  	@article = current_user.articles.build
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
	  @article = current_user.articles.build(article_params)
	 
	  if @article.save
	    redirect_to @article
	  else
	    render 'new'
	  end
	end
	 
	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end
	 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end

end
