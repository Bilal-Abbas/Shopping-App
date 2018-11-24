class CreateShops < ActiveRecord::Migration[5.2]
  def up
    create_table :shops do |t|
	
		t.string 'sname'

    	t.string 'stype'

      t.timestamps
    end
  end
   def down

  	drop_table :shops

  end
end
