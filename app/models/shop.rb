class Shop < ApplicationRecord

	#has_many :users

	#has_many :store_admins

	has_many :sellings, :as => :buyer

	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("pages.position ASC")}

	scope :newest_first, lambda { order("pages.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
