require_relative '../test_helper'

class UserDeletesASkillTest < FeatureTest
  def test_user_deletes_a_skill
    3.times do
      SkillInventory.create({ :title       => "Petting a capybara",
                              :description => "They are cute!"})
    end

    visit('/skills/1')
    click_button('Delete')

    assert_equal '/skills', current_path

    within('.collection') do
      refute page.has_content?("1. Petting a capybara")
      assert page.has_content?("2. Petting a capybara")
      assert page.has_content?("3. Petting a capybara")
    end
  end
end
