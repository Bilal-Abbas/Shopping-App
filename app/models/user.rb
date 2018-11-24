class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

	has_many :sellings
	has_many :products, through: :sellings
	has_many :buyers, through: :sellings, :source => :sell, :source_type => 'Selling'

	def admin?

		has_role? :admin

	end

	def buyer?

		has_role? :buyer

	end

	def seller?

		has_role? :buyer

	end


	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("pages.position ASC")}

	scope :newest_first, lambda { order("pages.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
