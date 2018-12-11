class UsersController < ApplicationController

	 # prepend_before_action :require_no_authentication, only: :cancel

	#before_action :confirm_logged_in
	@i == 0

	  def index
		    @users = User.seller
		    authorize @users
	  end

	  def show
	  	
		    @user = User.find(params[:id])
		    authorize @user
	  end

	  def edit
	  	@user = User.find(params[:id])
	  	authorize @user
	  end

	  def new
	  	#byebug
	    @user = User.new()
	  	authorize @user
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
	  	authorize @user
	  end

	  def delete
	  	@user = User.find(params[:id])
		authorize @user
	  end

	  def destroy
	  	@user = User.find(params[:id]).destroy
    	authorize @user
    	flash[:notice] = "The user has deleted sucessfully"
    	redirect_to(:controller => 'users', :action => 'index')
	  end

	private

    def user_params

    	params.require(:user).permit(:name, :type, :email, :password, :remember_me)

    end
	  
end
