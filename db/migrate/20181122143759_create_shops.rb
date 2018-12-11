class CreateShops < ActiveRecord::Migration[5.2]
  def up
    create_table :shops do |t|

  		t.integer 'store_admin_id'

      t.string 'name'

      t.string 'email'

    	t.string 'address'

      t.integer 'phone'

      t.timestamps
    end
     add_index :shops, "store_admin_id"
  end
   def down

  	drop_table :shops

  end
end
