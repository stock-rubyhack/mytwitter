class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # only call configured parameters when Devise pages are called. This save web server resource and speed up performance.
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protect the db , while allowing these fields to be updated.
  protected
  def configure_permitted_parameters
    # the old code below from tut is obseleted and no longer work..
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me)}
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me)}
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :password, :password_confirmation, :remember_me)}
    # new code below should work : https://stackoverflow.com/questions/37341967/rails-5-undefined-method-for-for-devise-on-line-devise-parameter-sanitizer
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :remember_me])
  end
end
