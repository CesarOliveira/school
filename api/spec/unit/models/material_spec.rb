require 'rails_helper'

RSpec.describe Material, type: :model do
  describe 'fields' do
    it do
      is_expected.to have_db_column(:id).of_type(:integer)
      is_expected.to have_db_column(:name).of_type(:string)
      is_expected.to have_db_column(:path).of_type(:string)
      is_expected.to have_db_column(:course_id).of_type(:integer)
      is_expected.to have_db_column(:created_at).of_type(:datetime)
      is_expected.to have_db_column(:updated_at).of_type(:datetime)
    end
  end

  describe 'relationships' do
    it do
      is_expected.to belong_to(:course)
    end
  end
end
