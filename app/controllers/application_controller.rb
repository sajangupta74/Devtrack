class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token


  protected

  def after_sign_in_path_for(dashboard)
    # return the path based on resource
    products_path
  end


end
