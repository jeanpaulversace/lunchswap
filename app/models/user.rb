require 'digest/sha1'

class User < ActiveRecord::Base
	
	has_many :foods

	acts_as_authentic do |c|
	  c.crypto_provider = Authlogic::CryptoProviders::BCrypt
	end # the configuration block is optional


end

