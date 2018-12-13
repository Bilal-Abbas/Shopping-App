class SellingPolicy

	attr_reader :user, :selling

	def initialize(user, selling)
		@user = user
		@selling = selling
	end

	def index?

		true

	end

	# def trade?

	# 	user.buyer?

	# end

	# def sell_to_user?
	# 	true
	# end

	def delete?

		true

	end

	def destroy?

		true

	end

end