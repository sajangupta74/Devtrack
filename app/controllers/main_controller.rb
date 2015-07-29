class MainController < ApplicationController

  before_action :authenticate_user!
  layout "controller_layouts" 
  
  respond_to :html, :json, :js
  def index
  	respond_to do |format|
  		format.html
  	end
  end

end
