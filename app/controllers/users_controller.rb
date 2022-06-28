class UsersController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User successfully created!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User was update succesfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  private

  def find_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
