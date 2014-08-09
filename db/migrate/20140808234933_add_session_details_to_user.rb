class AddSessionDetailsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :persistence_token
  	end
  end
end
