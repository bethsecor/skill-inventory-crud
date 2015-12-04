require_relative '../test_helper'

class UserDeletesASkillTest < FeatureTest
  def test_user_deletes_a_skill
    ids = []
    3.times do
      SkillInventory.create({ :title       => "Petting a capybara",
                              :description => "They are cute!"})
      ids += [SkillInventory.all.last.id]
    end

    visit("/skills/#{ids[0]}")
    click_button('Delete')

    assert_equal '/skills', current_path
    
    within('.collection') do
      refute page.has_content?("#{ids[0]}. Petting a capybara")
      assert page.has_content?("#{ids[1]}. Petting a capybara")
      assert page.has_content?("#{ids[2]}. Petting a capybara")
    end
  end
end
