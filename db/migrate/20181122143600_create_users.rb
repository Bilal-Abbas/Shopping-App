class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|

    	t.integer 'shop_id'
    	t.string 'name', :null => true
    	t.string 'type'

      t.timestamps
    end
    add_index("users",'shop_id')

  end
  
  def down

  	drop_table :users

  end
end
