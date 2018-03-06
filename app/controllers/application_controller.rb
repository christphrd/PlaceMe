class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize_page
    # byebug
    return head(:forbidden) unless session[:user_id] == @user.id
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def get_user
    @user = User.find(params[:id])
  end

end
