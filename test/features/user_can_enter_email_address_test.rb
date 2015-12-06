require_relative '../test_helper'

class UserCanEnterEmailAddressTest < FeatureTest
  def create_skills(num)
    num.times do |n|
      SkillInventory.create({ :title       => "title#{n+1}",
                              :description => "description#{n+1}"})
    end
  end

  def test_user_can_enter_email_address
    create_skills(5)
    visit('/skills')

    within('#skill-list-box') do
      click_link('Email Skills')
    end

    assert_equal '/skills/email', current_path

    within('#email-skills-form') do
      fill_in('name', with: "Miss Capybara")
      fill_in('email', with: "elizabeth.a.secor@gmail.com")
      click_button('Submit')
    end

    assert_equal '/skills', current_path
  end
end
