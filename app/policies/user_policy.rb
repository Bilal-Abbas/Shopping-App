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

	def destroy?
		user.present? && user == owner
	end

	def view_products?
		user.present? && user.admin?
	end


	private

		def owner
			record
		end

end