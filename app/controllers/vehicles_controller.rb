class VehiclesController < ApplicationController
  # POST /vehicles
  def submit_emission
    @vehicle = Vehicle.find_by(uuid: vehicle_params.dig(:uuid), timestamp: vehicle_params.dig(:timestamp))
    if @vehicle
      @vehicle.update!(vehicle_params)
    else
      @vehicle = Vehicle.create!(vehicle_params)
    end

    json_response(@vehicle, :created)
  end

  private
  def vehicle_params
    # whitelist params
    params.permit(:uuid, :vehicle_type, :latitude, :longitude, :timestamp, :heading)
  end
end
