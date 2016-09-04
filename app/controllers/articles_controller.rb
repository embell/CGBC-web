# Controller for Articles - to be used as a basis for a blog-like publication
class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :validate_permission, only: [:create, :edit, :update, :destroy]

  def index
    @title = 'Articles'
    @all_articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to '/articles'
      ChangeLog.write("==== New Article created ====
                       created by: #{current_user.email}
                       #{@article.inspect}\n")
    else
      flash[:error] = 'Article entry invalid: '
      @article.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def edit
    @article = Article.find(article_params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to '/articles'
    
    ChangeLog.write("==== Article updated ====
                       changed by: #{current_user.email}
                       #{@article.inspect}\n")
  end

  def destroy
    a = Article.find(params[:id])
    deleted_title = a.title
    deleted_info = a.inspect

    a.destroy

    flash[:success] = "Deleted article '#{deleted_title}'."
    redirect_to '/admin'

    ChangeLog.write("==== Article DELETED ====
                       removed by: #{current_user.email}
                       #{deleted_info}\n")
  end

  def article_params
    params.require(:article).permit(:id, :title, :author, :text)
  end

  # TODO: This function is redundant with same one in other resource controllers. Figure out where to define it.
  def validate_permission
    unless current_user.permissions.include?(:articles)
      flash[:error] = 'You do not have permission to edit Articles.'
      redirect_to '/admin'
    end
  end
end
