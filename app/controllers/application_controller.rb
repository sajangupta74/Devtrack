class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_username , :user_logged_in
  before_action :set_notifications

before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end

  
  rescue_from CanCan::AccessDenied do |exception|
    render file: 'public/unathorized.html.erb'
  end


  def user_logged_in
    if user_signed_in? === false && is_a?(::DeviseController) === false
      redirect_to new_user_session_path
    else
        #do nothing
    end
  end


#setting notifications for Admin
  def set_notifications_admin
    @notifications = Notification.where( user_id: current_user.id ).order(created_at: :desc).limit(7)
    @notifications_array = @notifications.select { |notification| notification }
    @new_notifications_array = @notifications.where( seen: false ).select(:description)
    @notifications_descriptions_array = @notifications.where( seen: false ).select(:userdescription)
  end


#setting notifications for normal user
  def set_notifications_user
    @notifications = Notification.where( sender_id: current_user.id ).order(created_at: :desc).limit(7) 
    @notifications_array = @notifications.select { |notification| notification }
    @new_notifications_array = @notifications.where( seen: false )
    @notifications_descriptions_array = @notifications.where( seen: false ).select(:userdescription)
  end

#set notification variable
  def set_notifications
    if user_signed_in? == true
      if current_user.is_admin == 1
        set_notifications_admin
      elsif current_user.is_admin == 0
        set_notifications_user
      end 
    end
  end



#setting username of Admin and normal users
  def set_username
    if user_signed_in?
      if UserInfo.find_by(user_id: current_user.id) != nil && current_user.is_admin == 0
        user = UserInfo.find_by(user_id: current_user.id)
        @username = user.first_name + " " + user.last_name
      elsif UserInfo.find_by(user_id: current_user.id) != nil && current_user.is_admin == 1
        @username = "Admin"
      elsif UserInfo.find_by(user_id: current_user.id) == nil
        @username = "New User"
      end
    end
  end


protected

  def after_sign_in_path_for(dashboard)
    # return the path based on resource
    main_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, 
      :password_confirmation, :address, :city) }

    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end


end