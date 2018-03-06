class UsersController < ApplicationController
  before_action :get_user, only: [:home, :show]
  before_action :require_login
  before_action :authorize_page, only: [:home]
  skip_before_action :require_login, only: [:new]

  def new
    @user = User.new
  end

  def create
    #BOILERPLATE
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id

    redirect_to "/users/home/#{@user.id}"
    # redirect_to controller: 'welcome', action: 'home'

    # @user = User.new(user_params)
    # byebug
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to @user
    # else
    #   render :new
    # end
  end

  def show
    # @user = User.find(params[:id])


  end

  def home
    #code
  end


  private

  def authorize_page
    return head(:forbidden) unless session[:user_id] == @user.id
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def get_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
