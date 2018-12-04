class CreateSellings < ActiveRecord::Migration[5.2]
  def up
    create_table :sellings do |t|

 		t.references :user, foreign_key: true
    	t.references :product, foreign_key: true
    	t.references :buyer, :polymorphic => true, :index => true

      t.timestamps
    end
  end
  def down

  	drop_table :sellings

  end
end