require_relative '../test_helper'

class UserNavigatesNavbarTest < FeatureTest
  def test_goes_to_homepage_when_skillz_clicked_from_homepage
    visit('/')
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_skills
    visit('/skills')
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_skills_new
    visit('/skills/new')
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_email
    visit('/skills/email')
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_a_skill_showpage
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}")
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_a_skill_edit
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}/edit")
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_homepage_when_skillz_clicked_from_capybara
    visit('/capybara')
    click_link('Skillz')

    assert_equal '/', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_homepage
    visit('/')
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_skills
    visit('/skills')
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_skills_new
    visit('/skills/new')
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_capybara
    visit('/capybara')
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_email
    visit('/skills/email')
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_a_skill_showpage
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}")
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_when_skillz_clicked_from_a_skill_edit
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}/edit")
    click_link('view_list')

    assert_equal '/skills', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_homepage
    visit('/')
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_skills
    visit('/skills')
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_skills_new
    visit('/skills/new')
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_capybara
    visit('/capybara')
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_email
    visit('/skills/email')
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_a_skill_showpage
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}")
    click_link('add')

    assert_equal '/skills/new', current_path
  end

  def test_goes_to_skills_new_when_skillz_clicked_from_a_skill_edit
    SkillInventory.create({ :title       => "Petting a capybara",
                            :description => "They are cute!"})
    id = SkillInventory.all.last.id
    visit("/skills/#{id}/edit")
    click_link('add')

    assert_equal '/skills/new', current_path
  end

end
