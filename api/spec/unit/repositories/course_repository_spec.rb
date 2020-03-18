# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CourseRepository, type: :repository do
  let(:data) do
    {
      id: Faker::Number.number(digits: 1),
      name: Faker::TvShows::GameOfThrones.house,
      details: Faker::Lorem.characters
    }
  end

  let(:result_query) { double }
  let(:course) { double }

  describe '.find_all' do
    before do
      allow(Course).to receive(:all)
      described_class.find_all()
    end

    it 'should call the all method on the Course model' do
      expect(Course).to have_received(:all)
    end
  end

  describe '.find_by_id' do
    before do
      allow(Course).to receive(:find)
      described_class.find_by_id(data[:id])
    end

    it 'should call the find method on the Course model' do
      expect(Course).to have_received(:find).with(data[:id])
    end
  end

  describe '.find_by_name' do
    before do
      allow(result_query).to receive(:all).and_return(:true)
      allow(Course).to receive(:where).and_return(result_query)

      described_class.find_by_name(data[:name])
    end

    it 'should call the where method on the Course model with the rigth query' do
      expect(Course)
        .to have_received(:where).with('lower(name) LIKE ?', "%#{data[:name].downcase}%")
    end
  end

  describe '.create' do
    before do
      allow(Course).to receive(:new).with(data)

      described_class.create(data)
    end

    it 'should call the new method on the Course model' do
      expect(Course).to have_received(:new).with(data)
    end
  end

  describe '.save' do
    before do
      allow(course).to receive(:save)

      described_class.save(course)
    end

    it 'should call the new save on the course instance' do
      expect(course).to have_received(:save)
    end
  end

  describe '.update' do
    before do
      allow(course).to receive(:update).with(data)

      described_class.update(course, data)
    end

    it 'should call the update method on the course instance' do
      expect(course).to have_received(:update).with(data)
    end
  end


  describe '.destroy' do
    before do
      allow(course).to receive(:destroy)

      described_class.destroy(course)
    end

    it 'should call the new destroy on the course instance' do
      expect(course).to have_received(:destroy)
    end
  end
end
