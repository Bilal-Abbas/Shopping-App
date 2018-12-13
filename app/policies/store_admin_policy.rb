class StoreAdminPolicy

	attr_reader :user, :store_admin

		def initialize(user, store_admin)
			@user = user
			@store_admin = store_admin
		end

		def  store_admin_index?
			current_user.store_admin?
		end

end