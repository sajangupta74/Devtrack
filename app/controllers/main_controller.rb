class MainController < ApplicationController

  #before_action :authenticate_user!
  layout "controller_layouts" 
  
  respond_to :html, :json, :js
  def index
  	respond_to do |format|
  		format.html
  	end
  end

  def get_device
  
    id=params[:id]
    @device=Device.find(id)
    if @device != nil
      respond_to do |format|
        format.json {render json: @device}
      end
    end
  end

  def assign_device
    id=params[:id]
    puts "#{id} #{id.class}"
    device=Device.find(id)
    DeviceQueue.create(device_id: device_id, user_id: current_user, time: Time.now)
    device.update(status_id: 3)
  end

end
