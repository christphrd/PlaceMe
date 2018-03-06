class SessionsController < ApplicationController
  #BOILERPLATE

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    # byebug
      if @user && @user.authenticate(params[:session][:password])
        # user = user.try(:authenticate, params[:user][:password])
        log_in @user
        redirect_to "/home/#{@user.id}"
        # return redirect_to(controller: 'sessions', action: 'new') unless user
        # session[:user_id] = user.id
        # @user = user
      else
        render :new
      end
  end



  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
