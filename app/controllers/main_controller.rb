class MainController < ApplicationController

  before_action :authenticate_user!
  layout "controller_layouts" 
  
  def index
  end

end
