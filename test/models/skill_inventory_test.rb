require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |n|
      SkillInventory.create({ :title       => "title#{n+1}",
                              :description => "description#{n+1}"})
    end
  end

  def test_count_is_zero_when_no_skills
    skills_all = SkillInventory.all

    assert_equal 0, skills_all.count
  end

  def test_it_creates_a_skill
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
    skill = SkillInventory.all.last
    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
  end

  def test_it_creates_two_skills_and_finds_all
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skills_all = SkillInventory.all

    assert_equal 2, skills_all.count
  end

  def test_it_creates_two_skills
    SkillInventory.create({ :title       => "a title",
                         :description => "a description"})
    skill_1 = SkillInventory.all.first
    assert_equal "a title", skill_1.title
    assert_equal "a description", skill_1.description

    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skill_1 = SkillInventory.all.first
    skill_2 = SkillInventory.all.last
    assert_equal "another title!", skill_2.title
    assert_equal "another description!", skill_2.description

    refute_equal "another title!", skill_1.title
    refute_equal "another description!", skill_1.description
  end

  def test_it_creates_ten_skills_and_finds_all
    create_skills(10)
    skills_all = SkillInventory.all

    assert_equal 10, skills_all.count
  end

  def test_it_updates_a_skill
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
     id_1 = SkillInventory.all.first.id
     skill_1 = SkillInventory.find(id_1)
     assert_equal "a title", skill_1.title
     assert_equal "a description", skill_1.description

     SkillInventory.update(id_1, {:title       => "another title!",
                               :description => "another description!"})
     skill_1 = SkillInventory.find(id_1)
     assert_equal "another title!", skill_1.title
     refute_equal "unicorns", skill_1.title
     assert_equal "another description!", skill_1.description
     refute_equal "unicorns", skill_1.description
  end

  def test_it_deletes_a_skill
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skills_all = SkillInventory.all
    assert_equal 2, skills_all.count
    SkillInventory.delete(skills_all.first.id)
    skills_all = SkillInventory.all
    assert_equal 1, skills_all.count
    SkillInventory.delete(skills_all.last.id)
    skills_all = SkillInventory.all
    assert_equal 0, skills_all.count
   end

   def test_it_deletes_skills_out_of_order
     SkillInventory.create({ :title       => "a title",
                             :description => "a description"})
     SkillInventory.create({ :title       => "another title!",
                             :description => "another description!"})
     skills_all = SkillInventory.all
     assert_equal 2, skills_all.count
     SkillInventory.delete(skills_all.last.id)
     skills_all = SkillInventory.all
     assert_equal 1, skills_all.count
     SkillInventory.delete(skills_all.first.id)
     skills_all = SkillInventory.all
     assert_equal 0, skills_all.count
    end
end
