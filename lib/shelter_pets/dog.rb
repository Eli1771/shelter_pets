class ShelterPets::Dog
  attr_accessor :name, :age, :sex, :breed, :location, :url, :pet_id

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

  def additional_info
    puts "Location: Helping Paws Rescue"
    puts "Bio: She's a good girl!"
    puts "Contact: 555-5555"
  end

end

#ShelterPets::Dog.new({:name => "Boomer", :age => "Puppy", :sex => "male", :url => ""})
#ShelterPets::Dog.new({:name => "Lilly", :age => "Puppy", :sex => "female", :url => ""})
#ShelterPets::Dog.new({:name => "Rex", :age => "Adult", :sex => "male", :url => ""})
