class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.string :requestee_food
    	t.string :requester_food
    	t.string :confirmed
    	t.string :active


      t.timestamps
    end
  end
end
