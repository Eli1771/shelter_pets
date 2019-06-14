class ShelterPets::CLI 
  attr_accessor :zip, :dogs

  def call 
    welcome 
    menu
  end 
  
  def welcome 
    puts "Welcome to Shelter Pets!" 
    zip = ""  
    until zip.match(/\d{5}/) 
      puts "To find available dogs near you, please enter your five-digit zip code:"
      zip = gets.strip
    end
    @zip = zip
  end 
  def menu 
    puts "Thanks! Here are the top 3 dogs in your area:"
    
    @dogs = ShelterPets::Dog.top_three
    @dogs.each_with_index do |dog, index|
      puts "#{index + 1}. #{dog.name} - #{dog.age} #{dog.sex} - #{dog.species}"
    end 
  
    input = gets.strip 
    if input.to_i > 0 
      dog = @dogs[input.to_i + 1]
      dog.additional_info
    elsif input == "exit" 
      goodbye
    else 
      puts "Sorry, I didn't understand that."
      puts "You can type the number that corresponds to any dog to find out more about him/her, or type exit"
    end
  end 
  def goodbye
    puts "Thank you! Come back tomorrow to see who's still available!"
  end 
end 