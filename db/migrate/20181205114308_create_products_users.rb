class CreateProductsUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :products_users, :id => false do |t|
    	t.integer 'user_id'
    	t.integer 'product_id'
        t.timestamps
    end
    add_index :products_users, ['user_id','product_id']
   end
    def down
    	drop_table :products_users
    end
end
