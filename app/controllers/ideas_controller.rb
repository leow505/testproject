class IdeasController < ApplicationController
	def index
		@current_user = User.find(session[:user_id])
		@ideas = Like.joins(:user).joins(:idea).select('users.alias', 'ideas.content', 'ideas.id as idea_id', :id, 'users.id as user_id').group(:idea_id)
	end
	def create
		newidea = Idea.create(user_id: session[:user_id], content:params[:ideas])
	  	redirect_to :back
	end
	def show
		@idea = Idea.joins(:user).select('users.alias', :content, :id, 'users.id as user_id').find(params[:id])
		@people_liked = Like.where(idea_id = params[:id]).joins(:user).joins(:idea).select('users.alias', :id, 'users.name').group(:user_id)
	end
	def delete
		Idea.find(params[:id]).destroy
		redirect_to :back
	end
end
