class Vehicle < ApplicationRecord
  include UuidHelper
  enum vehicle_type: [ :bus, :taxi, :tram, :train ]
end
