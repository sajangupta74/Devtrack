class MainController < ApplicationController

  before_action :authenticate_user!

  def index2
    render template: 'index'
  end

end
