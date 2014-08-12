require 'digest/sha1'

class UsersController < ApplicationController

	def index
		session = UserSession.find

		if session == nil
			render :layout => "users"
		else
			redirect_to '/user_sessions'
		end
	end

	def new
		@user = User.new
		render :layout => "users"
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Successfully created user."
			redirect_to '/user_sessions/new'
		else
			render :action => 'new', :layout => 'users'
		end 
	end

	private

  def user_params
    params.require(:user).permit(:login,:username, :password, :password_confirmation)
  end

end


