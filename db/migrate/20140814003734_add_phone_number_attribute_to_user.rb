class AddPhoneNumberAttributeToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :phonenumber
  	end
  end
end
