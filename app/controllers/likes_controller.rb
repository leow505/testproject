class LikesController < ApplicationController
	def create
		Like.create(idea_id:params[:id],user_id: session[:user_id])
		redirect_to :back
	end
end
