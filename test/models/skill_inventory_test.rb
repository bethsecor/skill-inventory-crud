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
    skill = SkillInventory.find(1)
    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
    assert_equal 1, skill.id
    refute_equal 33, skill.id
  end

  def test_it_creates_two_skills
    SkillInventory.create({ :title       => "a title",
                         :description => "a description"})
    skill_1 = SkillInventory.find(1)
    assert_equal "a title", skill_1.title
    assert_equal "a description", skill_1.description
    assert_equal 1, skill_1.id

    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skill_1 = SkillInventory.find(1)
    skill_2 = SkillInventory.find(2)
    assert_equal "another title!", skill_2.title
    assert_equal "another description!", skill_2.description
    assert_equal 2, skill_2.id

    refute_equal "another title!", skill_1.title
    refute_equal "another description!", skill_1.description
    refute_equal 2, skill_1.id
  end

  def test_it_creates_two_skills_and_finds_all
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skills_all = SkillInventory.all

    assert_equal 2, skills_all.count
  end

  def test_it_creates_ten_skills_and_finds_all
    create_skills(10)
    skills_all = SkillInventory.all

    assert_equal 10, skills_all.count
  end

  def test_it_updates_a_skill
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
     skill_1 = SkillInventory.find(1)
     assert_equal "a title", skill_1.title
     assert_equal "a description", skill_1.description
     assert_equal 1, skill_1.id

     SkillInventory.update(1, {:title       => "another title!",
                               :description => "another description!"})
     skill_1 = SkillInventory.find(1)
     assert_equal "another title!", skill_1.title
     refute_equal "unicorns", skill_1.title
     assert_equal "another description!", skill_1.description
     refute_equal "unicorns", skill_1.description
     assert_equal 1, skill_1.id
     refute_equal 2, skill_1.id
  end

  def test_it_deletes_a_skill
    SkillInventory.create({ :title       => "a title",
                            :description => "a description"})
    SkillInventory.create({ :title       => "another title!",
                            :description => "another description!"})
    skills_all = SkillInventory.all
    assert_equal 2, skills_all.count
    SkillInventory.delete(1)
    skills_all = SkillInventory.all
    assert_equal 1, skills_all.count
    SkillInventory.delete(2)
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
     SkillInventory.delete(2)
     skills_all = SkillInventory.all
     assert_equal 1, skills_all.count
     SkillInventory.delete(1)
     skills_all = SkillInventory.all
     assert_equal 0, skills_all.count
    end
end
