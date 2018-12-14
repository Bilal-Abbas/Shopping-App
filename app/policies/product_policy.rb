class ProductPolicy

	attr_reader :user, :product

	def initialize(user, product)
		@user = user
		@product = product
	end

	def index?
		user.present? && (user.buyer? || user.store_admin?)
	end

	def Sindex?
		user.present? && (user.buyer? || user.store_admin?)
	end


	def Buyer?

		user.present? && user.buyer?

	end

	def show?
		true
	end

	def view_users?

		user.present? && (user == product.users.first || user.store_admin?)
		#byebug
	end

	def new?
		user.store_admin? || user.seller?
	end

	def create?
    	user.present? && user == product.users.first && user.seller?
    	#byebug	
    end
	def delete?
    	user.present? && (user == product.users.first || user.store_admin?)
    	#byebug
	end

	def destroy?
		user.present? && (user == product.users.first || user.store_admin?)
	end

	#byebug

end