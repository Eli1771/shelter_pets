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
    all.clear
  end
  def self.top_ten
    all[0,10]
  end

  # add a class method that takes a string argument represetning a dog's name and returns all the dogs matching that name

  def self.find_by_name(name)
    # matching = []
    # all.each do |dog|
    #   if dog.name == name
    #     matching << dog
    #   end
    # end
    # matching
    all.select {|dog| dog.name == name}
  end

end
