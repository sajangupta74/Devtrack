class DevicesController < ApplicationController

layout "controller_layouts"
before_action :define

def index
	@devices=Device.all
end

def show 		
end

def new
	@device = Device.new
end

def create
	@device = Device.new(device_params)
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
