ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

# TODO: factor out shared code
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  fixtures :all

  def setup
    ActionController::Base.allow_forgery_protection = false
    # note: FactoryGirl will encrypt password but only if passed
    @unconfirmed_user = create(:unconfirmed_user, :password => 'password')
  end

  def logger
    Rails.logger
  end
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods

  def setup
    ActionController::Base.allow_forgery_protection = false
    # note: FactoryGirl will encrypt password but only if passed
    @unconfirmed_user = create(:unconfirmed_user, :password => 'password')
  end

  def logger
    Rails.logger
  end
end