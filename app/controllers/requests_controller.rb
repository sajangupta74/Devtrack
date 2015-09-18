class RequestsController < ApplicationController

before_action :authenticate_user!
load_and_authorize_resource
layout "controller_layouts" 

	def inqueue
		@requests = Request.inqueue
		if current_user.is_admin == 1
			render 'admin_requests'
		else
			render 'user_requests'
		end
	end

	def completed
		@requests = Request.completed
		render 'admin_requests'
	end
end
