class Vehicle < ApplicationRecord
  include UuidHelper
  enum vehicle_type: [ :bus, :taxi, :tram, :train ]

  validates :uuid, format: { with: /[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}/,
    message: "%{value} should be in UUID format." }
  validates :latitude, inclusion: { in: -90..90,
    message: "%{value} should be between -90 and 90." }
  validates :longitude, inclusion: { in: -180..180,
    message: "%{value} should be between -180 and 180." }
  validates :heading, inclusion: { in: 0..359,
    message: "%{value} should be between 0 and 359." }

  validate :timestamp_is_valid_datetime

  def timestamp_is_valid_datetime
    DateTime.parse(timestamp.to_s) rescue errors.add(:timestamp, 'must be a valid datetime')
  end
end
