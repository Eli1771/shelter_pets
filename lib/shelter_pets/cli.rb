class ShelterPets::CLI 

  def call 
    welcome 
    menu
    goodbye
  end 
  
  def welcome 
    puts "Welcome to Shelter Pets!" 
    
    zip = nil  
    until zip == /\d{5}/ 
      puts "To find available dogs near you, please enter your five-digit zip code:"
      zip = gets.strip 
    end
  end 
  def menu 
    puts "Thanks! Here are the top 3 dogs in your area:"
    #dogs have a name, age, sex and species
    puts "1. Mika - adult female - Lab/German Shephard mix"
    puts "2. Markie - puppy male - Chihuahua mix"
    puts "3. Bronx - puppy male - Pitt Bull mix"
  end 
  def goodbye
    puts "Thank you! Come back tomorrow to see who's still available!"
  end 
end 