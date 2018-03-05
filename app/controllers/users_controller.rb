class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #BOILERPLATE
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'

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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
