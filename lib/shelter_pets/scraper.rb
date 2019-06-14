class ShelterPets::Scraper 
  attr_accessor :zip, :all_dogs, :dog
  
  def initialize(zip = '89120')
    @zip = zip
  end
  
  def dogs_by_zip 
    browser = Watir::Browser.new :chrome 
    browser.goto "https://www.petfinder.com/search/dogs-for-adoption/us/nv/89120/"
    sleep 10 
    doc = Nokogiri::HTML(browser.html)
    binding.pry
  end 
  

end 