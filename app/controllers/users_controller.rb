class UsersController < ApplicationController
	 layout 'admin'

	#before_action :confirm_logged_in
	

	  def index
	    @users = User.all
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

	  #def new
	    #@user = User.new()
	  #end

	  #def create
	    #@user = User.new(user_params)
      #Save the object
        #if @user.save
        #If save succeeds, redirect to other page by an action
          #flash[:notice] = "User has saved successfully."
          #redirect_to(:action => 'index')
        #else
        #If the save fails, redisplay the form again to fix the problem
          #@subject_count = User.count + 1
          #render('new')
        #end
	  #end

	  def update
	  	authorize @user
	  end

	  def delete
	  	authorize @user
	  end

	  def destroy
	  	authorize @user
	  end

	#private

    #def user_params

     ##end
	  
end
