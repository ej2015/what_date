module WhatDate
	module DateOfMonth

		ORDINALS ={ "first" => 1, "second" => 2, "third" => 3, "fourth" => 4, "fifth" => 5, "last" => nil }.freeze

		def date_of_month(order:1, day:, month:, year: Date.today.year)
			month_int = Date::MONTHNAMES.index(month)
			first_date = Date.new(year, month_int, 1)
			first_day = first_date.wday
			lookup = Date::DAYNAMES.index(day.titleize)
			if lookup < first_day
				inc = (order - 1) * 7 + (lookup - first_day + 8)
			else
				inc = (order - 1) * 7 + (lookup - first_day +  1)
			end
			begin
				Date.new(year, month_int, inc)
			rescue ArgumentError
				nil
			end
		end	

		def method_missing(meth, *args, &block)
			if meth.to_s =~ /^(first||second||third||fourth||fifth||last)_(monday||tuesday||wednesday||thursday||friday||saturday||sunday)_of_[a-z]+_\d+$/i
				methods = meth.to_s.split("_")
				order = ORDINALS[methods[0].downcase]
				day = format_date_string methods[1]
				month = format_date_string methods[3]
				year = methods[4].to_i
				if order == nil 
					date_of_last_week_day_in_month(day, month, year)
				else
					date_of_month(order: order, day: day, month: month, year: year)
				end
			else
				super
			end
		end

		def last_date_of_month(month:, year:)
			Date.parse("#{year}-#{month}-1").end_of_month
		end

		private

		def format_date_string(str)
			str.downcase.capitalize
		end

		def date_of_last_week_day_in_month(lookup_day, month, year)
			last_date = last_date_of_month(month: month, year: year) 
			last_day = last_date.wday
			lookup = Date::DAYNAMES.index(lookup_day)
			diff = last_day - lookup
			diff += 7 if lookup > last_day
			last_date.days_ago(diff)
		end

	end
end
