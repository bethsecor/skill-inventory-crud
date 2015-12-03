ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

Capybara.app = SkillInventoryApp

class Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
