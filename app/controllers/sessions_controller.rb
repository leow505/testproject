class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
  end
  def create
	u = User.find_by_email(params[:email])
		if (u && u.authenticate(params[:password]))
			session[:user_id] = u.id
			redirect_to '/ideas'
		else
			flash[:errors] = 'Invalid login information'
			redirect_to :back
		end
	end
	def delete
		session.delete(:user_id)
		redirect_to '/'
	end
end
