class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.skills_table
    database.from(:skills)
  end

  def self.create(skill)
    skills_table.insert(skill)
  end

  def self.all
    skills_table.map { |data| Skill.new(data) }
  end

  def self.find(id)
    skill_data = skills_table.where(id: id).to_a.first
    Skill.new(skill_data)
  end

  def self.update(id, data)
    skills_table.where(id: id).update(data)
  end

  def self.delete(id)
    skills_table.where(id: id).delete
  end
end
