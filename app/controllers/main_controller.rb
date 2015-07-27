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
    DeviceQueue.create(device_id: id, user_id: current_user.id)
    device.update(status_id: 3)
    @user_id=User.joins(:DeviceQueue).find_by(device_id=id).email
    respond_to do |format|
        format.json {render json: {"device_data" => device, "user_id" => @user_id} }
    end
  end

end
