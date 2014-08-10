class Food < ActiveRecord::Base
	attr_accessor :name, :description, :user_id

	belongs_to :user
end
