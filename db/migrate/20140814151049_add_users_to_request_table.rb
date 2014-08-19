class AddUsersToRequestTable < ActiveRecord::Migration
  def change
  	change_table :requests do |t|
  		t.string :requestee_user_id
  		t.string :requester_user_id
  	end
  end
end
