class ShelterPets::Scraper 
  attr_accessor :zip, :all_dogs, :dog
  
  def initialize(zip = '89120')
    @zip = zip
  end
  
  def dogs_by_zip 
    #browser = Watir::Browser.new :chrome 
    #browser.goto "https://www.petfinder.com/search/dogs-for-adoption/us/nv/89120/"
    #sleep 10 
    
    Headless.ly do
      driver = Selenium::WebDriver.for :chrome
      driver.navigate.to 'http://google.com'
      puts driver.title
    end
    
    #html = open("https://www.petango.com/pet_search_results?speciesId=1&breedId=undefined&location=89120&distance=50")
    #puts html
    #sleep 2
    #doc = Nokogiri::HTML(html)
    #binding.pry
  end 
  

end 