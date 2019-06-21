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
    @dogs = ShelterPets::Dog.top_ten
    puts ""
    puts "Thanks! Here are the top 10 dogs in your area:"
    top_ten

    input = nil
    while input != "finished"
      input = gets.strip.downcase
      if input.to_i > 0
        dog = @dogs[input.to_i - 1]
        @scraper.dog_by_url(input.to_i - 1)
        additional_info(dog)
      elsif input == "new location"
        puts ""
        puts "Okay! Let's start again:"
        ShelterPets::Dog.clear
        welcome
        menu
        break
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

  def additional_info(dog)
    dog.sex == "Male" ? sex = "He" : sex = "She"
    puts ""
    puts "#{dog.name} is a #{dog.color} #{dog.breed}. #{sex} will be #{dog.size}. #{sex} is #{dog.traits}"
    puts ""
    puts "Additional background: #{dog.bio}" if dog.bio
    puts ""
    puts "#{dog.name} is cared for by #{dog.shelter} rescue. You can contact them for more information at #{dog.contact}!"
    puts ""
    puts "Press enter/return when you're finished!"
    gets.strip
    puts "Here are the top ten dogs in your area:"
    top_ten
  end

  def top_ten
    @dogs.each_with_index do |dog, index|
      puts "#{index + 1}. #{dog.name} - #{dog.life_stage} #{dog.sex} - #{dog.location}"
    end
    puts ""
    puts "You can type the number that corresponds to any dog to find out more about him/her, or you can type 'new location' to search a new area, or type finished"
  end

  def goodbye
    puts ""
    puts "Thank you! Come back tomorrow to see who's still available!"
  end
end
