class AddRequestsAttributeToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :requests
  	end
  end
end
