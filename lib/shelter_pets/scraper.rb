class ShelterPets::Scraper 
  attr_accessor :zip, :all_dogs, :dog
  
  def initialize(zip = '89120')
    @zip = zip
  end
  
  def dogs_by_zip 
    browser = Watir::Browser.new 
    browser.goto("https://theshelterpetproject.org/pet-search/?zip=89120&radius=25&species=dog&resultPage=1")
    doc = Nokogiri::HTML.parse(browser.html)
    puts doc
  end 
  

end 