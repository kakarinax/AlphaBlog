class ArticlesController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy]
  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(required_params)
    if @article.save
      flash[:notice] = 'Article successfully created!'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(required_params)
      flash[:notice] = 'Article was update succesfully!'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_id
    @article = Article.find(params[:id])
  end

  def required_params
    params.require(:article).permit(:title, :description)
  end
end
