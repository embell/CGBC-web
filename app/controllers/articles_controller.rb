class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to '/admin'
    else
      flash[:error] = 'Article entry invalid: '
      @article.errors.full_messages.each do |err|
        flash[:error] += err 
      end
      redirect_to '/admin'
    end
  end

  def article_params
    params.require(:article).permit(:title, :author, :text)
  end
end
