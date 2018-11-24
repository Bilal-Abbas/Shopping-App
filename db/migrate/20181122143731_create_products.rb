class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
		
		t.string 'pname', :null => true;

    	t.integer 'pquantity', :null => true;
    	
      t.timestamps
    end
  end

  def down

  	drop_table :products

  end
end
