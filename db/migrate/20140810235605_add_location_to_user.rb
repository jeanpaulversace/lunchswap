class AddLocationToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :latitude
  		t.string :longitude
  		t.string :username
  	end

  	change_table :foods do |t|
  		t.string :latitude
  		t.string :longitude
  		t.string :owner
  	end
  end
end
