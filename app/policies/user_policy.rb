class UserPolicy < ApplicationPolicy

	def index?

		user.seller? || user.store_admin?

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
		true
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

	def sell_to_user?
		user.present? && user.seller?
	end

	def selling_to_user?

		user.seller?
	end

	def home?
		true
	end

	private

		def owner
			record
			#byebug
		end

end