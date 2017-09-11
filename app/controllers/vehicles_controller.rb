class VehiclesController < ApplicationController
  # POST /vehicles
  def create
    @vehicle = Vehicle.create!(vehicle_params)
    json_response(@vehicle, :created)
  end

  private
  def vehicle_params
    # whitelist params
    params.permit(:uuid, :vehicle_type, :latitude, :longitude, :timestamp, :heading)
  end
end
