class StoreAdminController < ApplicationController
	
	before_action :require_user
	before_action :require_admin, only: [:Sindex, :new, :create, :delete, :destroy]

	def Sindex
		begin
			@user = User.find(1)
		  	authorize @user
		  	@users = User.all
		rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	    end

	end
	 def new
	  	#byebug
	  	begin
	  	@store_admin = User.find(1)
	  	authorize @store_admin
	  	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')		
	    end
	    @user = User.new()
	  	#byebug
	  end

	  def create
	  	begin
	    @user = User.new(user_params)
      	authorize @user
      	rescue 
	  		flash[:notice] = 'You do not have such privillages'
	  		redirect_to(controller: 'public', action: 'system_error_Access_denied')		
	    end
        if @user.save
          flash[:notice] = "User has saved successfully."
          redirect_to(:action => 'Sindex')
        else
          flash[:notice] ='User already exits'
          render('new')
        end
	  end

	  def delete
	  	
	  	@user = User.find(params[:id])
	  	# byebug
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
	  		redirect_to root_path	
	    end
	    @user = User.find(params[:id]).destroy
    	flash[:notice] = "The user has deleted sucessfully"
    	redirect_to(controller: 'public', action: 'system_error_Access_denied')	
	  end

private

    def user_params

      params.require(:user).permit(:name, :type, :email, :password, :remember_me)

    end

    def require_admin
    	if current_user != User.find(1)
    		flash[:danger] = "You are not an Admin"
    	end
    end
end

