class Product < ApplicationRecord
	
	has_many :sellings

	has_and_belongs_to_many :users

	has_and_belongs_to_many :shops


	validates_presence_of :name
	validates :name, :length => {:maximum => 20, :message => ' is a too long...'}
	validates_presence_of :price
	
	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("product.position ASC")}

	scope :newest_first, lambda { order("product.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
