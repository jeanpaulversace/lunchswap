class RequestsController < ApplicationController

	def create
		requestee_user_id = User.where(username: params[:requestee_user_id]).first.id

		check = Request.where(requester_user_id: params[:requester_user_id], requestee_user_id: params[:requestee_user_id])

		if check.blank?
    	request = Request.new(requestee_user_id: requestee_user_id, requester_user_id: params[:requester_user_id], requestee_food: params[:requestee_food], requester_food: params[:requester_food])
    end

    if request.save
    	render '/user_sessions'
    else
    	raise 'error'
    end
	end

	def answer_request
		request = Request.find(params[:request_id].to_i)

		if params[:decision] == "confirm"
			request.update_attributes(confirmed: "t", active: "f")
		else 
			request.update_attribute(:active, "f")
		end

		render "/user_sessions"
	end

end
