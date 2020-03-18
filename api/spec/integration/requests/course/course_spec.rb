require 'rails_helper'

RSpec.describe 'courses requests', type: :request do

  let(:items_to_create) { Faker::Number.non_zero_digit }
  let!(:courses) { create_list(:course, items_to_create) }

  let(:headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'Resquest to list all offers from a plan' do

    before do
      get(
        "/api/courses",
        headers: headers
      )
    end

    it 'must match json schema' do
      expect(response).to match_json_schema('courses/index')
    end

    it 'must return the correct number of courses' do
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['items'].size).to eq(items_to_create)
    end

    it 'must return status ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
