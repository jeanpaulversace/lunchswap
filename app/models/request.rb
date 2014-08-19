class Request < ActiveRecord::Base
	has_many :requests
	after_initialize :init

	def init
	  self.active ||= true           #will set the default value only if it's nil
	  self.confirmed ||= false #let's you set a default association
	end
end
