class CreateShops < ActiveRecord::Migration[5.2]
  def up
    create_table :shops do |t|

  		t.integer 'store_admin_id', null: true;

      t.string 'name', :limit => 30

      t.string 'email', :limit => 100

    	t.string 'address'

      t.integer 'phone', :limit => 6

      t.timestamps
    end
     add_index :shops, "store_admin_id"
  end
   def down

  	drop_table :shops

  end
end
