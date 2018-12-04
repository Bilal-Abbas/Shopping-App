class Product < ApplicationRecord
	has_many :sellings, dependent: :destroy
	has_many :users, through: :sellings
	
	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("product.position ASC")}

	scope :newest_first, lambda { order("product.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
