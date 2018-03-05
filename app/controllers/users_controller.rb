class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(users_params)
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
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
    @user = User.find(params[:id])


  end


  private


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
