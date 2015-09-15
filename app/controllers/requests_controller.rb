class RequestsController < ApplicationController

before_action :authenticate_user!
load_and_authorize_resource
layout "controller_layouts" 

	def inqueue
		@requests = Request.inqueue
		render 'requests'
	end

	def completed
		@requests = Request.completed
		render 'requests'
	end
end
