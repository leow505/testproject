class UsersController < ApplicationController
	before_action :log_user, only: [:new]

	def new
		
	end
	def show
		@finduser = User.find(params[:id])
		@totalideas = Idea.joins(:user).where(user_id: params[:id]).count
		@totallikes = Like.where(:user_id => params[:id]).count
	end
	def create
		newuser = User.create(user_params)
	  	if newuser.save
	  		flash[:success] = 'Successfully registered, login to continue'
	  		redirect_to :back
	  	else
	  		flash[:message] = newuser.errors.full_messages
	  		redirect_to :back
	  	end
	end
	private
	  def user_params
	  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	  end
end
