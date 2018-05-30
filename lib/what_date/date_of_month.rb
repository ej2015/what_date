module WhatDate
	module DateOfMonth

		ORDINALS ={ "first" => 1, "second" => 2, "third" => 3, "fourth" => 4, "fifth" => 5 }.freeze

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


		def method_missing(meth, *args)
			if meth.to_s =~ /^(first||second||third||fourth||fifth)_(monday||tuesday||wednesday||thursday||friday||saturday||sunday)_of_[a-z]+_\d+$/i
				methods = meth.to_s.split("_")
				order = ORDINALS.[methods[0].downcase]
				day = format_date_string methods[1]
				month = format_date_string methods[3]
				year = methods[4].to_i
				date_of_month(order: order, day: day, month: month, year: year)
			else
				super
			end
		end

		private

		def format_date_string(str)
			str.downcase.capitalize
		end

	end
end
