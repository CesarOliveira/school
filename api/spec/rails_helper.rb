require 'spec_helper'
require 'simplecov'

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Repositories', 'app/repositories'
  add_group 'Models', 'app/models'
  add_group 'Libs', 'lib'
end

Shoulda::Matchers.configure do |shoulda|
  shoulda.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
