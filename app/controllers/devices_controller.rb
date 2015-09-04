class DevicesController < ApplicationController

	#before_action :authenticate_user!
	#load_and_authorize_resource
	layout "controller_layouts"
	before_action :define


	def index
		@devices=Device.all
		@devices_users=User.joins(:DeviceQueue)
		@assign_devices=DeviceQueue.all
		@current_user=current_user

		requests = Request.all 				#getting all requested devices

		@requested_devices_info = {}		#contains all information of the device which is requested 
											#by the users {device_id, sender_id, sender_name}

		requested_devices = Array.new		#Array of all of the devices, which are requested

		if requests != nil						#if single device has been requested
			requests.each do |request| 
				requested_devices << request
			end
			i=1;
			requests.length.times do
				device_id = requested_devices[i-1].device_id
				sender_id = requested_devices[i-1].sender_id
				userinfo = UserInfo.find_by(user_id: sender_id)
				username = userinfo.first_name + " " + userinfo.last_name
				
				@requested_devices_info["device_id_#{requested_devices[i-1].device_id}"] = {
						device_id: device_id,
						sender_id: sender_id,
						username: username
				}
				i = i+1
			end
		else							# if no device has been  requested
			@requested_devices = nil
		end
	end



	def request_device

		id=params[:id]
		@device = Device.find(id)

		userinfo=UserInfo.find_by(user_id: current_user.id)
		username=userinfo.first_name + " " + userinfo.last_name

	#generating device request
		request=Request.create(sender_id: current_user.id, reciever_id: 1, device_id: @device.id)

	#generating notification
		notification=Notification.create(request_id: request.id, user_id: 1, 
			sender_id: current_user.id, description: "#{username} requested for #{@device.name}",
			activity_type: 1, seen: false, open: false, userdescription: "You have requested #{@device.name}")

		if ( request != nil && notification != nil )
			respond_to do |format|
				@device.update(status_id: 4)
		    	format.json {render json: {"message" => "success"} }
		    	devices_path
			end
		else
			respond_to do |format|
		    	format.json {render json: {"message" => "fail"} }
		    	devices_path
			end
		end
	end



	  def get_device
	    id=params[:id]
	    puts params.inspect
	    @device=Device.find(id)
	    if @device != nil
	    	case @device.status_id
	    		when 1
	    			respond_to do |format|
		        		format.json {render json: { "data" => @device, "message" => "available" } }		        
		      		end
		      	when 2
		      		respond_to do |format|
		        		format.json {render json: { "data" => @device, "message" => "not available" } }		        
		      		end
		      	when 3
		      		respond_to do |format|
		        		format.json {render json: {"message" => "using"} }
		      		end
		      	when 4
		      		respond_to do |format|
		        		format.json {render json: {"message" => "requested"} }
		      		end
		     end
	    end
	  end



	  def assign_device
	    id=params[:id].to_i
	    device=Device.find(id)
	    if device.status_id == 1
	    	DeviceQueue.create(device_id: id, user_id: current_user.id, time: Time.now, 
	    		return_time: Time.now+7200)		#return time is 2 hours ahead
	    	device.update(status_id: 3)
	    	@user_id=User.joins(:DeviceQueue).find_by(device_id=id).email
	    	
	    	respond_to do |format|
	        	format.json {render json: {"device_data" => device, "user_id" => @user_id, "message" => "success"} }
	    	end
	    else
	    	respond_to do |format|
	        	format.json {render json: {"message" => "Device already in use"} }
	    	end
	    end
	  end


	def show 		
	end



	def new
		@device = Device.new
	end



	def create
		@device = Device.new(device_params)
		@device.update(status_id: 1)
		flash[:notice] = "Device was successfully created." if @device.save
		redirect_to devices_path
	end



	def edit
	end



	def update
		flash[:notice] = "Device was successfully updated." if @device.update(device_params)
	end



	def destroy
		flash[:notice] = "Device was successfully deleted." if @device.destroy
	end




	private
		def set_device
			@device = Device.find(params[:id])
		end


		def device_params
			params.require(:device).permit(:name,:slug,:device_type)
		end


		def define
			@device_type=Array.new
			device_types = DeviceType.all

			device_types.each do |device|
				@device_type << device.device_type
			end
		end

end
