class CreateProductsShops < ActiveRecord::Migration[5.2]
  def up
    create_table :products_shops do |t|
    	t.integer 'shop_id'
    	t.integer 'product_id'
        t.timestamps
    end
    add_index :products_shops, ['shop_id','product_id']
  end
  def down
  	drop_table :products_shops
  end
end
