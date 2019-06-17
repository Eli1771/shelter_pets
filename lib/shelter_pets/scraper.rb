class ShelterPets::Scraper
  attr_accessor :zip, :all_dogs, :dog

  def initialize(zip = '89120')
    @zip = zip
  end

  def dogs_by_zip
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto "https://theshelterpetproject.org/pet-search/?zip=#{@zip}&radius=25&species=dog&resultPage=1"
    sleep 2
    doc = Nokogiri::HTML(browser.html)
    dogs = doc.css('div.search__pet-basic-details')
    dogs.each do |dog_info|
      name = dog_info.css('span.search__pet-name').text
      breed = dog_info.css('span.search__pet-breed').text
      sex = dog_info.css('span.search__pet-meta').text.split(" ").first
      age = dog_info.css('span.search__pet-meta').text.split(" ").last
      attributes = {name: name, breed: breed, sex: sex, age: age}
      dog = ShelterPets::Dog.new(attributes)
    end
  end


end
