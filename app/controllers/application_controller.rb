class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

 	protect_from_forgery

 	include Pundit

 	after_action :verify_authorized, unless: :devise_controller?
    
 
 def after_sign_in_path_for(resource)
     if current_user.store_admin?
       store_admin_path_url
     elsif current_user.seller?
       user_path_url
    else
        product_path_url
     end
end



    # def after_sign_in_path_for(resource)
    #   sign_in_url = new_user_session_path
    #   #byebug
    #   #root_path
    #   if current_user.store_admin?
    #   	flash[:notice] = "You have logged in."
    #   	redirect_to users_path
    #   else
    #   	flash[:notice] = "Something went wrong."
    #     stored_location_for(resource) || request.referer || root_path
    #   end
    # end


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
