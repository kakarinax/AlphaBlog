class ArticlesController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  
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
    @article.user = current_user

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

  def authenticate_user!
    unless current_user
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
