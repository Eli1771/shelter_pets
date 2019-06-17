class ShelterPets::Scraper
  attr_accessor :zip, :all_dogs, :dog

  def initialize(zip = '89120')
    @zip = zip
  end

  def dogs_by_zip
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto "https://theshelterpetproject.org/pet-search/?zip=89120&radius=25&species=dog&resultPage=1"
    sleep 2
    doc = Nokogiri::HTML(browser.html)
    dogs = doc.css('li.search__pet').first
    dogs.each do |dog|
      dog = Dog.new

    end
  end


end
