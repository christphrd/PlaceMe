class UsersController < ApplicationController
  before_action :get_user, only: [:home, :show]
  before_action :require_login
  before_action :authorize_page, only: [:home]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    @user.places.build
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to "/home/#{@user.id}"
  end

  def show

  end

  def home

  end


  private
  #
  # def authorize_page
  #   return head(:forbidden) unless session[:user_id] == @user.id
  # end
  #
  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

  # def get_user
  #   @user = User.find(params[:id])
  # end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :places_attributes => [:name, :country])
  end
end
