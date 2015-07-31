class DevicesController < ApplicationController

	before_action :authenticate_user!
	layout "controller_layouts"
	before_action :define

	def index
		@devices=Device.all
		@devices_users=User.joins(:DeviceQueue)
		@assign_devices=DeviceQueue.all
		@current_user=current_user
	end

	  def get_device
  
	    id=params[:id]
	    @device=Device.find(id)
	    if @device != nil
	    	if @device.status_id === 1
		      respond_to do |format|
		        format.json {render json: { "data" => @device, "message" => "success" } }
		      end
		  	else
		  	  respond_to do |format|
		        format.json {render json: {"message" => "Device already in use"} }
		      end
		  	end
	    end
	  end

	  def assign_device
	    id=params[:id].to_i
	    device=Device.find(id)
	    if device.status_id == 1
	    	DeviceQueue.create(device_id: id, user_id: current_user.id, time: Time.now)
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
