class UsersController < ApplicationController

	def welcome
		render :layout => "welcome-registration-signin"
	end
	
end
