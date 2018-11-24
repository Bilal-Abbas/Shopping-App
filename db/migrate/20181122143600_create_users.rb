class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|

    	t.string 'uname', :null => true

    	t.string 'utype', :null => true

      t.timestamps
    end
  end
  
  def down

  	drop_table :users

  end
end
