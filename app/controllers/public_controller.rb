class PublicController < ApplicationController

	def home
		@user = User.all
		begin
		authorize @user
		rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	end
	def system_error_Access_denied
		@user = User.all
		begin
		authorize @user
		rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	end
end
