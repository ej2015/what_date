require 'active_support'
require 'active_support/core_ext/date/calculations'
module WhatDate
	class Client 

		Date::DAYS_INTO_WEEK.each do |day, inc|
			define_method(day) do |ref_date=nil|
				ref_date ||= Date.today
				ref_date.monday.days_since(inc)
			end
		end
	end
end
