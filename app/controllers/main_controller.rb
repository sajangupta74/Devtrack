class MainController < ApplicationController

  #before_action :authenticate_user!
  layout "controller_layouts" 
  
  respond_to :html, :json, :js
  def index
  	respond_to do |format|
  		format.html
  	end
  end

  def assign_device
  
    id=params[:id]
    @device=Device.find(id)
    if @device != nil
      respond_to do |format|
        format.json {render json: @device}
      end
    end

  end

end
