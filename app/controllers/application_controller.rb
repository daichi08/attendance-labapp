class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_sign_in!
  helper_method :signed_in?
  
  protect_from_forgery with: :exception
  
  def current_user
    remember_token = Laboratory.encrypt(cookies[:user_remember_token])
    @current_user ||= Laboratory.find_by(remember_token: remember_token)
  end
  
  def sign_in(user)
    # TODO: 多重ログイン用の応急処置、そのうちしっかりなおしたい
    remember_token = user.remember_token.nil? ? Laboratory.new_remember_token : user.remember_token 
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: Laboratory.encrypt(remember_token))
    @current_user = user
  end
  
  def sign_out
    cookies.delete(:user_remember_token)
  end
  
  def signed_in?
    @current_user.present?
  end
  
  private

  def require_sign_in!
    redirect_to log_in_path unless signed_in?
  end
end
