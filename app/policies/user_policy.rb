class UserPolicy < ApplicationPolicy

	def index?
		true
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
		user.present? && (user == owner && user.seller?)
	end

	def buy_products?
		user.present? && user.buyer?
	end

	def trade?

		user.present?

	end

	def selling_to_user?

		true

	end

	private

		def owner
			record
			#byebug
		end

end