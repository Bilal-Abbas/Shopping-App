class SellingsController < ApplicationController

  def index
  	#authorize @user
  end

  def trade
  	@user = User.find(params[:user_id])
    authorize @user
    @product = Product.find(params[:product_id])
  	@selling = Selling.new()
  	
  end

  def buying_from_user
  	@user = User.find(params[:buyer_id])
    authorize @user
    product = Product.find(params[:product_id])
  	@selling = Selling.new(selling_params)
  	
  	#byebug
  	if @selling.save
      flash[:notice] = "The Product has been purchased"
      @user.products << product
      #byebug
      #@product = @user.products.find(params[:product_id]).destroy
      redirect_to(:controller => 'sellings', :action => 'transaction', :id => @user.id)
    else
      flash[:notice] = "The Product has not been purchased"
      redirect_to(:controller => 'products', :action => 'index', :id => @user.id)
    end
  end

    def sell_to_shop
      @seller = User.find(params[:seller_id])
      authorize @seller
      @shops = Shop.all
      #byebug
      @product = @seller.products
      @selling = Selling.new()
    end


    def selling_to_shop
        @seller = User.find(params[:seller_id])
        authorize @seller
        @selling = Selling.new(selling_params)

        if @selling.save
        flash[:notice] = "The Product has been sold."
        #byebug
        #@product = @user.products.find(params[:product_id]).destroy
        redirect_to(:controller => 'sellings', :action => 'transaction')
      else
        flash[:notice] = "The Product has not been sold"
        redirect_to(:controller => 'users', :action => 'buyer_page')
      end
    end


    def buy_products_from_users
      @store_admin = User.find(1)
      authorize @store_admin
      @user = User.find(params[:user_id])
      @shops = Shop.all
      @product = Product.find(params[:product_id])
      @selling = Selling.new()

    end

     def buying_products_from_users
        @store_admin = User.find(1)
        authorize @store_admin
        @shop = Shop.find(params[:shop_id])
        product = Product.find(params[:product_id])
        @selling = Selling.new(selling_params)

        if @selling.save
        flash[:notice] = "The Product has been sold."
        @shop.products << product
        #byebug
        #@product = @user.products.find(params[:product_id]).destroy
        redirect_to(:controller => 'sellings', :action => 'transaction')
      else
        flash[:notice] = "The Product has not been sold"
        redirect_to(:controller => 'products', :action => 'index')
      end
    end

     def buy_products_from_shops
      @buyer = User.buyer
      authorize @buyer
      @shops = Shop.find(params[:user_id])
      @product = Product.find(params[:product_id])
      @selling = Selling.new()

    end

     def buying_products_from_shops
        @buyer = User.buyer
        authorize @buyer
        product = Product.find(params[:product_id])
        @user = User.find(params[:buyer_id])
        @selling = Selling.new(selling_params)

        if @selling.save
        flash[:notice] = "The Product has been purchased from shop."
        @user.products << product
        #byebug
        #@product = @user.products.find(params[:product_id]).destroy
        redirect_to(:controller => 'sellings', :action => 'transaction')
      else
        flash[:notice] = "The Product has not purchased from shop"
        redirect_to(:controller => 'products', :action => 'index')
      end
    end

    def transaction

      @users = User.all
      authorize @users
      @products = Product.all
      @sellings = Selling.all

    end


  # 	@user = User.find(params[:id])
  # 	@selling = User.find(params[:id]).sellings.first

  # 	#byebug

  # 	authorize @user

  # 	if @selling.update_attributes(buyer_type: 'User', buyer_id: current_user.id)

  #   flash[:notice] = "The product has been purchased"
    
  #   redirect_to(:controller => 'users', :action => 'index')
   
  #  else
   
  #  flash[:notice] = "Product was not bought"
   
  #   render('trade')
  # end

  def delete
  	#authorize @user
  end

  def destroy
  	#authorize @user
  end

  private

    def selling_params

    	#byebug

      params.require(:selling).permit(:user_id, :product_id,:product_price, :buyer_type, :buyer_id)

    end
end
