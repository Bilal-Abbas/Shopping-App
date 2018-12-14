# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
		 store_admin = User.new({ name: "GigaLabs", email: 'gigalabs@gmail.com',
		               password: '72a22ctevta'})

		    if store_admin.save
		      store_admin.add_role :store_admin
		      shop = Shop.create(store_admin_id: store_admin.id, name: 'Anarkalli Febrics', email: 'anarkalli@gmail.com', phone: 923015853980, address: 'Chowk Ehl-e-Hadees Jhelum')

		    elsif admin.errors.any?
		      admin.errors.full_messages.each do |msg|
		        puts msg
		      end
		    else
		      puts "****NOT VALID****"
		end