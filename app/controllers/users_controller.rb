class UsersController < ApplicationController

	 # prepend_before_action :require_no_authentication, only: :cancel

	#before_action :confirm_logged_in

	before_action :require_user

	  def index
		    @users = User.seller
		begin
		    authorize @users
		rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  end

	  def buyer_page
	  		@users = User.buyer
	  	begin
	  		authorize @users
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  end

	  def show
	  	
		    @user = User.find(params[:id])
		begin
		    authorize @user
		rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  end

	  def edit
	  		@user = User.find(params[:id])
	  	begin
	  		authorize @user
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  end

	  def new
	  	#byebug
	    	@user = User.new()
	    begin
	  		authorize @user
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  	#byebug
	  end

	  # def create
	  #   @user = User.new(user_params)
   #    	authorize @user
      	
      	
   #      if @user.save
   #        flash[:notice] = "User has saved successfully."
   #        redirect_to(:action => 'index')
   #      else
   #        flash[:notice] = "User has not creted."
   #        render('new')
   #      end
	  # end

	  def update
	  	begin
	  		authorize @user
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end
	  end

	  def delete
	  		@user = User.find(params[:id])
	  	begin
	  		authorize @user
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end		
	  end

	  def destroy
	  	@user = User.find(params[:id])
	  	begin
    		authorize @user
    	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end	
	    @user = User.find(params[:id]).destroy
    	flash[:notice] = "The user has deleted sucessfully"
    	redirect_to(:controller => 'users', :action => 'index')
	  end

	private

    def user_params

    	params.require(:user).permit(:name, :type, :email, :password, :remember_me)

    end
	  
end
