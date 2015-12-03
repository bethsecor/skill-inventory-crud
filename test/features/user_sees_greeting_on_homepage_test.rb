require_relative '../test_helper'

class UserSeesGreetingOnHomepageTest < FeatureTest
  def test_greeting_is_displayed_on_homepage
    visit('/')

    within('#dash-title') do
      assert page.has_content?("Welcome to your skill inventory!")
      refute page.has_content?("Welcome to the Task Manager!")
    end
  end
end
