require 'spec_helper'

describe WhatDate do

	let(:client) { described_class.client }

	it "has a version number" do
		expect(WhatDate::VERSION).not_to be nil
	end

	it "returns the date of Monday" do
		expect(client.monday).to eq Date.today.monday
	end

	it "returns the date of Tuesday" do
		expect(client.tuesday).to eq Date.today.monday + 1
	end

	it "returns the date of Wednesday" do
		expect(client.wednesday).to eq Date.today.monday + 2
	end

	it "returns the date of Thursday" do
		expect(client.thursday).to eq Date.today.monday + 3
	end

	it "returns the date of Friday" do
		expect(client.friday).to eq Date.today.monday + 4
	end

	it "returns the date of Saturday" do
		expect(client.saturday).to eq Date.today.monday + 5
	end

	it "returns the date of Sunday" do
		expect(client.sunday).to eq Date.today.monday + 6
	end

	it "returns the date of next Sunday" do
		expect(client.sunday(Date.today.next_week)).to eq Date.today.monday + 6 + 7
	end

	describe "#date_of_month" do

		it "returns the date of first Monday of May 2018" do
			expect(client.date_of_month(day: "Monday", month: "May")).to eq Date.new(2018,5,7)
		end

		it "returns the date of first Wednesday of May 2018" do
			expect(client.date_of_month(day: "Wednesday", month: "May")).to eq Date.new(2018,5,2)
		end

		it "returns the date of first Tuesday of May 2018" do
			expect(client.date_of_month(day: "Tuesday", month: "May")).to eq Date.new(2018,5,1)
		end

		it "returns the date of second Monday of September 2018" do
			expect(client.date_of_month(order: 2, day: "Monday", month: "September", year: 2018)).to eq Date.new(2018,9,10)
		end

		it "returns the date of third Saturday of September 2018" do
			expect(client.date_of_month(order: 3, day: "Saturday", month: "September", year: 2018)).to eq Date.new(2018,9,15)
		end

		it "returns the date of third Friday of September 2018" do
			expect(client.date_of_month(order: 3, day: "Friday", month: "September", year: 2018)).to eq Date.new(2018,9,21)
		end

		it "returns the date of fourth Thursday of Nov 2017" do
			expect(client.date_of_month(order: 4, day: "Thursday", month: "November", year: 2017)).to eq Date.new(2017,11,23)
		end

		it "returns the date of first Thursday of August 2019" do
			expect(client.date_of_month(day: "Thursday", month: "August", year: 2019)).to eq Date.new(2019,8,1)
		end

		it "returns nil if date does not exist" do
			expect(client.date_of_month(order: 9, day: "Thursday", month: "August", year: 2019)).to eq nil
		end
	end

	describe "helpers for date of month" do

		it "returns the date of first Monday of May 2018" do
			expect(client.first_monday_of_may_2018).to eq Date.new(2018,5,7)
		end

		it "returns the date of first Wednesday of May 2018" do
			expect(client.first_wednesday_of_may_2018).to eq Date.new(2018,5,2)
		end

		it "returns the date of fourth Thursday of Nov 2017" do
			expect(client.fourth_thursday_of_november_2017).to eq Date.new(2017,11,23)
		end

		it "is case insensitive" do
			expect(client.fourTH_tHursday_of_NOVEMBER_2017).to eq Date.new(2017,11,23)
		end

		it "defaults to current year" do
			expect(client.fourTH_tHursday_of_NOVEMBER).to eq Date.new(Date.today.year,11,22)
		end

	end

	describe "#prev_" do
		it "returns prevous monday" do
			expect(client.prev_monday).to eq Date.today.monday - 7
		end

		it "returns prevous Tuesday" do
			expect(client.prev_monday(Date.new(2018,2,1))).to eq Date.new(2018,1,22)
		end

		it "is aliased as #last_" do
			expect(client.last_monday(Date.new(2018,2,1))).to eq Date.new(2018,1,22)
			expect(client.last_wednesday(Date.new(2018,3,12))).to eq client.prev_wednesday(Date.new(2018,3,12))
		end
	end

	describe "#next_" do
		it "returns prevous monday" do
			expect(client.next_monday).to eq Date.today.monday + 7
		end

		it "returns prevous Tuesday" do
			expect(client.next_monday(Date.new(2018,2,1))).to eq Date.new(2018,2,5)
		end
	end

	describe "#last_" do
		it "returns 26th for last thursday of apr 2018" do
			expect(client.last_thursday_of_april_2018).to eq Date.new(2018,4,26)
		end

		it "returns 30th for last monday of apr 2018" do
			expect(client.last_monday_of_april_2018).to eq Date.new(2018,4,30)
		end

		it "returns 29th for last sunday of apr 2018" do
			expect(client.last_sunday_of_april_2018).to eq Date.new(2018,4,29)
		end
	end

	describe "#last_date_of_month" do
    it "returns 31st for August of 2018" do
      expect(client.last_date_of_month(month: "August", year: 2018)).to eq Date.new(2018,8,31)
		end

    it "returns 29th for feb  of 2000" do
      expect(client.last_date_of_month(month: "feb", year: 2000)).to eq Date.new(2000,2,29)
		end

		it "works with numerical month too" do
      expect(client.last_date_of_month(month: 2, year: 2000)).to eq Date.new(2000,2,29)
		end

    it "returns nil for invalid dates" do
      expect(client.last_date_of_month(month: 14, year: 2018)).to eq nil
		end
	end

end
