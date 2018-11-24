class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

 	protect_from_forgery with: :exception

 	include Pundit

 	after_action :verify_authorized, unless: :devise_controller?

	protected

		def configure_permitted_parameters

			devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:uname, :utype, :email, :password, :remember_me)}

			devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password, :remember_me)}

			devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:uname, :utype, :email, :password, :current_password, :remember_me)}

		end

end
