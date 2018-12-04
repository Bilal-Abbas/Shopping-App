class User < ApplicationRecord
	self.inheritance_column = :foo
 	rolify
  	after_save :after_add_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

	has_many :sellings, dependent: :destroy
	has_many :products, through: :sellings, dependent: :destroy
	#has_many :buyers, through: :sellings, :source => :buyer, :source_type => 'Selling'
	belongs_to :shop, :foreign_key => 'shop_id', optional: true

	# validates_presence_of :uname
	# validates_length_of :uname, :maximum => 30
	# validates_presence_of :permalink
	# validates_length_of :name, :within => 0..25
	# validates_uniqueness_of :permalink

	def store_admin?

		self.has_role? :store_admin

	end

	def seller?

		self.has_role? :seller

	end

	def buyer?

		self.has_role? :buyer

	end

	private
    
     def after_add_user
     	#byebug

     	if self.type == 'seller'

	 		self.add_role(:seller)
	 		
	 	elsif self.type == 'buyer'

	 		self.add_role(:buyer)
	 	end
      end
#byebug

	scope :visible, lambda { where(:visible => true) }
	
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("pages.position ASC")}

	scope :newest_first, lambda { order("pages.created_at DESC")}

	scope :search, lambda{|query| where(["name LIKE ?","%#{query}%"])}
end
