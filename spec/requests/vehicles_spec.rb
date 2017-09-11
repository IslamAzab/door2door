require 'rails_helper'

RSpec.describe 'Vehicles API', type: :request do
  # Test suite for POST /vehicles
  describe 'POST /submit_emission' do
    # valid payload
    let(:valid_attributes) {{
      uuid: '4b2abde4-9573-11e7-b73d-507b9dfc0684',
      vehicle_type: :bus,
      timestamp: '2017-09-11 00:00:00',
      latitude: 52.5166809,
      longitude: 13.4111879,
      heading: 270
    }}

    context 'when the request is valid' do
      before { post '/submit_emission', params: valid_attributes }

      it 'creates a vehicle' do
        expect(json['latitude']).to eq(52.5166809)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/submit_emission', params: { heading: -1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed:/)
      end
    end
  end
end