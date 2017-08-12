class Link < ApplicationRecord

	def generate_short_url
		self.short_url = SecureRandom.urlsafe_base64(5)
	end

end
