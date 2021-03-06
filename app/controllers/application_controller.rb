class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
