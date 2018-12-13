class Shop < ApplicationRecord

	has_many :users, as: :store_admin

	#has_many :store_admins

	has_many :sellings, :as => :buyer

	has_and_belongs_to_many :products

	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("pages.position ASC")}

	scope :newest_first, lambda { order("pages.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
