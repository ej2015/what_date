module WhatDate
	module DateOfMonth

		ORDINALS ={ "first" => 1, "second" => 2, "third" => 3, "fourth" => 4, "fifth" => 5, "last" => nil }.freeze
		ORDERS = 'first||second||third||fourth||fifth||last'.freeze
		WEEKDAYS = 'monday||tuesday||wednesday||thursday||friday||saturday||sunday'.freeze
		MONTHS = 'jan||feb||mar||apr||may||jun||jul||aug||sep||oct||nov||dec||january||february||march||april||may||june||july||august||september||october||november||december||sept'.freeze


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

		def method_missing(name, *args, &block)
			methods = missing_method_reg.match(name)
			if methods 
				order = ORDINALS[methods[1].downcase]
				day = format_date_string methods[2]
				month = format_date_string methods[3]
				year = methods[4].to_i
				order == nil ? date_of_last_week_day_in_month(day, month, year) :
				               date_of_month(order: order, day: day, month: month, year: year)
			else
				super
			end
		end

		def last_date_of_month(month:, year:)
			begin
				Date.parse("#{year}-#{month}-1").end_of_month
			rescue ArgumentError
				nil
			end
		end

		private

		def missing_method_reg
      Regexp.new("^(#{ORDERS})_(#{WEEKDAYS})_of_(#{MONTHS})_(\\d+)$", true)
		end

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
