class PublicController < ApplicationController

	def home
		@user = User.all
		authorize @user
	end
	def system_error_Access_denied
		@user = User.all
		authorize @user
	end
end
