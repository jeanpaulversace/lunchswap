class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.string :name
    	t.text :description
    	t.references :user

      t.timestamps
    end
  end
end
