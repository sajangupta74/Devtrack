class DevicesController < ApplicationController

layout "controller_layouts"

def index
end

def show 	
end

def new
	@product = Product.new
end

def create
	@product = Product.new(device_params)
	flash[:notice] = "Device was successfully created." if @product.save
end

def edit
end

def update
	flash[:notice] = "Device was successfully updated." if @product.update(device_params)
end

def destroy
	flash[:notice] = "Device was successfully deleted." if @product.destroy
end

private
	def set_device
		@device = Device.find(params[:id])
	end

	def device_params
		params.require(:device).permit(:name, :id, :device_type)
	end

end
