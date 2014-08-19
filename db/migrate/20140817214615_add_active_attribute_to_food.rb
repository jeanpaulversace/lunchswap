class AddActiveAttributeToFood < ActiveRecord::Migration
  def change
  	change_table :foods do |t|
  		t.string :active
  	end
  end
end
