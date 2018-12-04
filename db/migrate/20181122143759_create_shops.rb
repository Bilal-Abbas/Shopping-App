class CreateShops < ActiveRecord::Migration[5.2]
  def up
    create_table :shops do |t|

  		t.string 'name'

      t.string 'email'

    	t.string 'address'

      t.integer 'phone'

      t.timestamps
    end
  end
   def down

  	drop_table :shops

  end
end
