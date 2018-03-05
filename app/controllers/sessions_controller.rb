class SessionsController < ApplicationController
  #BOILERPLATE

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    #adapt welcome page to our project
    #redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end
