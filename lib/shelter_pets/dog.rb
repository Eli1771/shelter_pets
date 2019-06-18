class ShelterPets::Dog
  attr_accessor :name, :life_stage, :age, :sex, :breed, :location, :url, :bio, :color, :size, :traits, :shelter, :contact

  @@all = []

  def initialize(attr_hash = {})
    attr_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end
  def self.clear
    @@all.clear
  end
  def self.top_ten
    @@all[0,10]
  end

end
