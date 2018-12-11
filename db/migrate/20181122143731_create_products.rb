class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
		
		t.string 'name', :null => true;

    	t.integer 'price', :null => true;
    	
      t.timestamps
    end
  end

  def down

  	drop_table :products

  end
end
