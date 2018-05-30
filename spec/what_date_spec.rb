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

end
