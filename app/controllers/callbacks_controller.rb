class CallbacksController::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user] = @user
    render 'index'
=begin
    sign_in_and_redirect @user
=end
  end
end