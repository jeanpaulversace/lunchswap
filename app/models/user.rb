class User < ActiveRecord::Base
	has_many :foods

	acts_as_authentic do |c|
		c.crypto_provider = Authlogic::CryptoProviders::BCrypt
	end

end
