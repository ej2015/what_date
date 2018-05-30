require "what_date/version"
require "what_date/client"

module WhatDate

	def self.client
		WhatDate::Client.new
	end
end
