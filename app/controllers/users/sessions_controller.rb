class Users::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  befor_action :set_values

  attr_accessible @user

  def set_values
    @user[:username] = ""
    @user[:password] = ""
  end

  def login

    status =  User.user_exist? params[:username], params[:password]

    case status
      when "User"
        redirect_to controller: "main", action: "index"
      when "String"
        render action: "new"
      else
        render action: "new"
    end

  end


  # GET /resource/sign_in
  def new
     super

  end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) << :attribute
   end





end
