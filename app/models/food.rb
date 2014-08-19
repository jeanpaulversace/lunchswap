class Food < ActiveRecord::Base
	belongs_to :user
	after_initialize :init

	def init
	  self.active ||= true
	end
end
