class Link < ApplicationRecord

	def generate_short_url
		self.short_url = SecureRandom.urlsafe_base64(5)
	end

	def long_url_format
		unless self.long_url.include?("http://") || self.long_url.include?("https://")
			self.long_url = "https://" + self.long_url
		end
	end

end
