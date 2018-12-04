class ApplicationController < ActionController::Base
	layout 'admin'

	before_action :configure_permitted_parameters, if: :devise_controller?

 	protect_from_forgery with: :exception

 	include Pundit

 	after_action :verify_authorized, unless: :devise_controller?
 
 def after_sign_in_path_for(user)
     if current_user.store_admin?
       return users_url
     else
       return products_url
     end
  end

   private

	  def layout_by_resource
		    if devise_controller?
		      "devise"
		    else
		      "application"
		    end
		end


	protected

		def configure_permitted_parameters

			devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :type, :email, :password, :remember_me)}

			devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password, :remember_me)}

			devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :type, :email, :password, :current_password, :remember_me)}

		end

end
