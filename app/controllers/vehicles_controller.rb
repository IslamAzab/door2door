class VehiclesController < ApplicationController
  # POST /vehicles
  def submit_emission
    if Vehicle.is_in_range?(vehicle_params)
      @vehicle = Vehicle.find_by(uuid: vehicle_params.dig(:uuid), timestamp: vehicle_params.dig(:timestamp))
      if @vehicle
        @vehicle.update!(vehicle_params)
      else
        @vehicle = Vehicle.create!(vehicle_params)
      end

      json_response(@vehicle, :created)
    else
      json_response({message: "Vehicle out of range!"}, :accepted)
    end
  end

  private
  def vehicle_params
    # whitelist params
    params.permit(:uuid, :vehicle_type, :latitude, :longitude, :timestamp, :heading)
  end
end
