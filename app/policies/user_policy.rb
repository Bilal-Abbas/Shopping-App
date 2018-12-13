class UserPolicy < ApplicationPolicy

	

	def index?

		user.seller? || user.store_admin?

	end

	def new?

		user.store_admin?

	end

	def Sindex?

		user.store_admin?

	end

	def Admin?

		user.store_admin? && user.present?

	end

	def Seller?

		user.present? && (user == owner && user.seller?)

	end

	def show?
		true
	end

	def edit?
		user.present? && user == owner
	end

	def delete?
		user.store_admin?
	end

	def destroy?
		user.present? && user.store_admin?
	end

	def create?
		true
	end


	def create_users?
		user.present? && user.store_admin?
	end

	def add_products?
		
	end

	def buy_products?
		user.present? && user.buyer?
	end

	def trade?

		user.present? && user.buyer?

	end

	def buying_from_user?

		user.buyer?

	end

	def sell_to_shop?
		user.present? && user.seller?
	end

	def selling_to_shop?

		user.seller?
	end

	def buy_products_from_users?

		user.store_admin?

	end 

	def buying_products_from_users?

		user.store_admin?

	end 

	def buy_products_from_shops?
		user.present? && (user.buyer? || user.store_admin?) 
	end

	def buying_products_from_shops?
		user.buyer? || user.store_admin?
	end

	def home?
		true
	end

	def buyer_page?
		user.present? && user.buyer?
	end

	def transaction?
		user.store_admin? || (user.seller? || user.buyer?)
	end
	def system_error_Access_denied?
		user.present?
	end
	private

		def owner
			record
			#byebug
		end

end