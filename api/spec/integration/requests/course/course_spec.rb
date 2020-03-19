require 'rails_helper'

RSpec.describe 'courses requests', type: :request do

  let(:items_to_create) { Faker::Number.non_zero_digit }
  let!(:courses) { create_list(:course, items_to_create) }

  let(:headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'Resquest to list all courses' do

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

  describe 'Resquest to show a course' do

    context 'when the course exists' do
      let(:course) { courses.first }

      before do
        get(
          "/api/courses/#{course.id}",
          headers: headers
        )
      end

      it 'must return status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'must match json schema' do
        expect(response).to match_json_schema('courses/show')
      end
    end

    context 'when the course does not exists' do

      let(:nonexistent_course_id) { Faker::Number.number(digits: 4) }

      before do
        get(
          "/api/courses/#{nonexistent_course_id}",
          headers: headers
        )
      end

      it 'must return status not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'must match json data error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']).to include("Couldn't find Course with 'id'=#{nonexistent_course_id}")
      end
    end

  end

  describe 'Resquest to create new course' do

    let(:data) do
      {
        "course": {
            "name": Faker::Book.title,
            "details": Faker::Book.author
        }
      }
    end

    context 'when send with the right data' do

      before do
        post '/api/courses', params: data
      end

      it 'must return status created' do
        expect(response).to have_http_status(:created)
      end

      it 'must match json schema' do
        expect(response).to match_json_schema('courses/create')
      end

    end

    context 'when send with the wrong data' do

      before do
        data[:course].delete(:name)
        post '/api/courses', params: data
      end

      it 'must return status unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must match json data error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']).to include("Name can't be blank")
      end
    end

    context 'when an error occurs during save' do

      before do
        allow_any_instance_of(Course).to receive(:save).and_return(false)
        post '/api/courses', params: data
      end

      it 'must return status unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'Resquest to update a course' do

    let(:course) { create(:course) }

    let(:data) do
      {
        "course": {
            "name": Faker::Book.title,
            "details": Faker::Book.author
        }
      }
    end

    context 'when send with the right data' do

      before do
        put "/api/courses/#{course.id}", params: data
      end

      it 'must return status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'must match json schema' do
        expect(response).to match_json_schema('courses/update')
      end
    end

    context 'when an error occurs during update' do

      before do
        allow_any_instance_of(Course).to receive(:update).and_return(false)

        put "/api/courses/#{course.id}", params: data
      end

      it 'must return status unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
