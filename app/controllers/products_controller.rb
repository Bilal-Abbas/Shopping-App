class ProductsController < ApplicationController

    before_action :find_user

  def index
    @users = User.buyer
    @products = Product.all
    @shops = Shop.all
    begin
      authorize @products
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
  end

  def Sindex
    @users = User.all
    @products = Product.all
    @shops = Shop.all
    begin
      authorize @products
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
  end

  def show
     @product = Product.find(params[:id])
    begin
      authorize @product
     rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
  end

  def new
    @product = Product.new()
    begin
      authorize @product
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
    #byebug

  end

  def create
    @product = Product.new(product_params)
    @shop = Shop.find(1)
    begin
      authorize(@product, :new?)
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
    #byebug
    if @product.name.present? && (@product.price.present? && @product.price != 0)

        if current_user.store_admin?
          @product.save
          @shop.products << @product
          flash[:notice] = 'The product has been created successfully and dispalyed at Shop side'
          redirect_to(:controller => 'store_admin', :action => 'Sindex')
        
        elsif current_user.seller? 
            @product.save
            #byebug
            current_user.products << @product
            flash[:notice] = 'The product has been created successfully and dispalyed at User side'
            redirect_to(:controller => 'users', :action => 'index')
        else

          redirect_to(:controller => 'users', :action => 'index')

        end

    else

    flash[:notice] = 'No field should be blank or wrong arguments'

    redirect_to(:action => 'new')

    end
    
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
  end

  def delete
    #byebug
    @product = Product.find(params[:id])
    begin
    authorize @product
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end  
  end

  def destroy
    # puts '#############################################################################################################'
    @product = Product.find(params[:id])
    begin
    authorize @product
    rescue 
        flash[:notice] = 'You do not have such privillages'
        redirect_to(controller: 'public', action: 'system_error_Access_denied') 
    end
    @product = Product.find(params[:id]).destroy
    # byebug
    flash[:notice] = "The product has deleted sucessfully"
    redirect_to(:controller => 'users', :action => 'index')
  end

  private

    def product_params

      params.require(:product).permit(:user_id, :name, :price, :created_at)
    end

    def find_user

      if params[:user_id]

        @user = User.find(params[:user_id])

      end
    
    end

end
