require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({ "title"       => "underwater basketweaving",
                        "description" => "self-explanatory",
                        "id"          => 1 })
    assert_equal "underwater basketweaving", skill.title
    assert_equal "self-explanatory", skill.description
    assert_equal 1, skill.id
  end

  def test_assigns_attributes_correctly_sad
    skill = Skill.new({ "title"      => "underwater basketweaving",
                        "description" => "self-explanatory",
                        "id"          => 1 })
    refute_equal "underwater", skill.title
    refute_equal "self", skill.description
    refute_equal 0, skill.id
  end

  def test_assigns_attributes_correctly_blank_title
    skill = Skill.new({ "title"       => "",
                        "description" => "nothing to see here",
                        "id"          => 1 })
    assert_equal "", skill.title
    assert_equal "nothing to see here", skill.description
    assert_equal 1, skill.id
  end

  def test_assigns_attributes_correctly_blank_description
    skill = Skill.new({ "title"       => "singing",
                        "description" => "",
                        "id"          => 1 })
    assert_equal "singing", skill.title
    assert_equal "", skill.description
    assert_equal 1, skill.id
  end

  def test_assigns_attributes_correctly_blank_title_and_description
    skill = Skill.new({ "title"       => "",
                        "description" => "",
                        "id"          => 1 })
    assert_equal "", skill.title
    assert_equal "", skill.description
    assert_equal 1, skill.id
  end
end
