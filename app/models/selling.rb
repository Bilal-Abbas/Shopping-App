class Selling < ApplicationRecord
	belongs_to :product
 	belongs_to :user
  	belongs_to :buyer, :polymorphic => true, optional: true
  	
  	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("pages.position ASC")}

	scope :newest_first, lambda { order("pages.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}


end
