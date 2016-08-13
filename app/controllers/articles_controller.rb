class ArticlesController < ApplicationController
  def index
    @title = 'Articles'
    @all_articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to '/articles'
    else
      flash[:error] = 'Article entry invalid: '
      @article.errors.full_messages.each do |err|
        flash[:error] += err 
      end
      redirect_to '/admin'
    end
  end

  def destroy
    a = Article.find(params.require(:article).permit(:id)[:id])
    deleted_title = a.title
    a.destroy
    
    flash[:success] = "Deleted article '#{deleted_title}'." 
    redirect_to '/admin'
  end

  def article_params
    params.require(:article).permit(:title, :author, :text)
  end
end
