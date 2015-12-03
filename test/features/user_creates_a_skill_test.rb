require_relative '../test_helper'

class UserCreatesASkillTest < FeatureTest
  def test_user_creates_a_skill
    visit('/skills/new')

    within('#new-skill-form') do
      fill_in('skill[title]', with: "Petting a capybara")
      fill_in('skill[description]', with: "They are cute!")
      click_button('Submit')
    end

    assert_equal '/skills', current_path

    visit('/skills/1')

    within('.card-content') do
      assert page.has_content?("Petting a capybara")
      assert page.has_content?("They are cute!")
    end
  end
end
