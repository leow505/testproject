class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def log_user
  	if session[:user_id]
  		redirect_to '/ideas'
  		end  		
  end
  protect_from_forgery with: :exception
end
