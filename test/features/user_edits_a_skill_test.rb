require_relative '../test_helper'

class UserEditsASkillTest < FeatureTest
  def test_user_edits_a_skill
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}/edit")

    within('#edit-skill-form') do
      fill_in('skill[title]', with: "Petting a capybara")
      fill_in('skill[description]', with: "They are SOOOO cute!")
      click_button('Submit')
    end

    assert_equal "/skills/#{id}", current_path

    within('.card-content') do
      assert page.has_content?("Petting a capybara")
      assert page.has_content?("They are SOOOO cute!")
    end
  end
end
