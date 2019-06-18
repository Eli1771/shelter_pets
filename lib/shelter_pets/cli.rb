###to do: fix endless loop in finished
###lowercase all inputs
###error handle invalid zip codes
class ShelterPets::CLI
  attr_accessor :dogs, :zip, :scraper

  def call
    welcome
    menu
  end
  def welcome
    puts "Welcome to Shelter Pets!"
    zip = ""
    until zip.match(/^[0-9]{5}$/)
      puts "To find available dogs near you, please enter your five-digit zip code:"
      zip = gets.strip
    end
    @zip = zip
    @scraper = ShelterPets::Scraper.new(@zip)
    @scraper.dogs_by_zip
  end

  def menu
    puts ""
    puts "Thanks! Here are the top 10 dogs in your area:"
    @dogs = ShelterPets::Dog.top_ten
    @dogs.each_with_index do |dog, index|
      puts "#{index + 1}. #{dog.name} - #{dog.age} #{dog.sex} - #{dog.breed}"
    end
    puts ""
    puts "You can type the number that corresponds to any dog to find out more about him/her, or you can type 'new location' to search a new area, or type finished"

    input = nil
    while input != "finished"
      input = gets.strip
      if input.to_i > 0
        dog = @dogs[input.to_i - 1]
        @scraper.dog_by_url(input.to_i - 1)
      elsif input == "new location"
        puts ""
        puts "Okay! Let's start again:"
        ShelterPets::Dog.clear
        self.call
      elsif input == "finished"
        goodbye
        break
      else
        puts ""
        puts "Sorry, I didn't understand that."
        puts "You can type the number that corresponds to any dog to find out more about him/her, or type finished"
      end
    end
  end

  def goodbye
    puts ""
    puts "Thank you! Come back tomorrow to see who's still available!"
  end
end
