require 'active_support'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'
require 'what_date/date_of_month'

module WhatDate
	class Client 
		include WhatDate::DateOfMonth

		Date::DAYS_INTO_WEEK.each do |day, inc|
			define_method(day) do |ref_date=nil|
				ref_date ||= Date.today
				ref_date.monday.days_since(inc)
			end
		end

		Date::DAYS_INTO_WEEK.each do |day, inc|
			define_method("prev_#{day.to_s}".to_sym) do |ref_date = nil|
		     send(day, ref_date).days_ago(7)
			end
		end	

		Date::DAYS_INTO_WEEK.each do |day, inc|
			define_method("last_#{day.to_s}".to_sym) do |ref_date = nil|
			  send("prev_#{day.to_s}".to_sym, ref_date)
			end
		end	

		Date::DAYS_INTO_WEEK.each do |day, inc|
			define_method("next_#{day.to_s}".to_sym) do |ref_date = nil|
		     send(day, ref_date).days_since(7)
			end
		end			

	end
end
