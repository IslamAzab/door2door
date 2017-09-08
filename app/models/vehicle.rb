class Vehicle < ApplicationRecord
  enum vehicle_type: [ :bus, :taxi, :tram, :train ]
end
