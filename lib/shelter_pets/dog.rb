

class ShelterPets::Dog 
  attr_accessor :name, :age, :sex, :species, :url 
  
  @@all = [self.new({:name => "Boomer", :age => "Puppy", :sex => "male", :url => ""}), self.new({:name => "Lilly", :age => "Puppy", :sex => "female", :url => ""}), self.new({:name => "Rex", :age => "Adult", :sex => "male", :url => ""})]
  
  def initialize(attr_hash = {})
    attr_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end 
    @@all << self
  end 
  
  def self.top_three
    @@all[0,3]
  end 
end 

