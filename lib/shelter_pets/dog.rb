class ShelterPets::Dog 
  attr_accessor :name, :age, :sex, :species, :url 
  
  @@all = []
  
  def initialize(attr_hash)
    attr_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end 
    @@all << self
  end 
  
end 