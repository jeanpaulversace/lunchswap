class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :login
    	t.string :encrypted_password
    	t.string :feedback
    	t.string :persistence_token

      t.timestamps
    end
  end
end
