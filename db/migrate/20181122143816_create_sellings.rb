class CreateSellings < ActiveRecord::Migration[5.2]
  def up
    create_table :sellings do |t|

      t.integer 'user_id', :null => false;
    	t.integer 'product_id', :null => false;
      t.integer 'product_price', :null => false;
    	t.references :buyer, :polymorphic => true, :index => true

      t.timestamps
    end
    add_index :sellings, ['user_id', 'product_id']
  end
  def down

  	drop_table :sellings

  end
end