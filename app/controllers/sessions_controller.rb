class SessionsController < ApplicationController

  def new

  end


  def create
    if params[:user][:password] == ""
      redirect_to  '/sessions/new'
    else
      @user = User.find_by(name: params[:user][:name])
      return redirect_to '/sessions/new' unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/users/home'
    end
  end
end
