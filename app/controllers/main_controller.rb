class MainController < ApplicationController

  before_action :authenticate_user!
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
    id=params[:id].to_i
    puts "#{id} #{id.class}"
    device=Device.find(id)
    DeviceQueue.create(device_id: id, user_id: current_user)
    device.update(status_id: 3)
    respond_to do |format|
        format.json {render json: {"message" => "success"}}
    end
  end

end
