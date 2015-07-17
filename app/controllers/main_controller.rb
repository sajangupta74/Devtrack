class MainController < ApplicationController

  before_action :authenticate_user!
  layout "controller_layouts" 
  
  respond_to :html, :js
  def index
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def assign_device

  end

end
