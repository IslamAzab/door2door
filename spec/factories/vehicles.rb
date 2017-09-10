FactoryGirl.define do
  factory :vehicle do
    uuid UUIDTools::UUID.timestamp_create().to_s
    vehicle_type :bus
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    timestamp Faker::Time.between(DateTime.now - 1, DateTime.now)
    heading (0..359).to_a.shuffle.first
  end
end