require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "validations" do
    it "should have all attributes set" do
      vehicle = build :vehicle
      expect( vehicle ).to be_valid

      vehicle = build :vehicle, uuid: nil
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, timestamp: nil
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, latitude: nil
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, longitude: nil
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, heading: nil
      expect( vehicle ).to_not be_valid
    end

    it "should have a valid uuid" do
      vehicle = build :vehicle, uuid: "abc"
      expect( vehicle ).to_not be_valid
    end

    it "should have a valid timestamp" do
      vehicle = build :vehicle, timestamp: "2017"
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, timestamp: "15-15-2017"
      expect( vehicle ).to_not be_valid
    end

    it "should have latitude from -90 to 90" do
      vehicle = build :vehicle, latitude: -91
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, latitude: 91
      expect( vehicle ).to_not be_valid
    end

    it "should have longitude from -180 to 180" do
      vehicle = build :vehicle, longitude: -181
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, longitude: 181
      expect( vehicle ).to_not be_valid
    end

    it "should have heading from 0 to 359" do
      vehicle = build :vehicle, heading: -1
      expect( vehicle ).to_not be_valid

      vehicle = build :vehicle, heading: 360
      expect( vehicle ).to_not be_valid
    end
  end
end