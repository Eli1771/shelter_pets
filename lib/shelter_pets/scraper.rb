##Abstract browser out to be used by multiple method

class ShelterPets::Scraper
  attr_accessor :zip, :all_dogs, :dog

  def initialize(zip = '89120')
    @zip = zip
  end

  def dogs_by_zip
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto "https://www.adoptapet.com/dog-adoption/search/50/miles/#{zip}"
    sleep 2
    doc = Nokogiri::HTML(browser.html)
    dogs = doc.css('div.petcard__content')
    dogs.each do |dog_info|
      name = dog_info.css('h4.pet-card__heading').text
      sex = dog_info.css('span.pet-card__content--comma').first.text.strip
      life_stage = dog_info.css('span.pet-card__content--comma')[1].text.strip
      dog_info.css('span.pet-card__content--comma')[2].text.strip == 'Special Needs' ? location = dog_info.css('span.pet-card__content--comma')[3].text.strip : location = dog_info.css('span.pet-card__content--comma')[2].text.strip
      url = dog_info.css('a.pet-card__link').attribute('href').value
      attributes = {name: name, sex: sex, life_stage: life_stage, location: location, url: url}
      dog = ShelterPets::Dog.new(attributes)
    end
  end

  def dog_by_url(index)
    dog = ShelterPets::Dog.all[index]
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto dog.url
    sleep 2
    doc = Nokogiri::HTML(browser.html)
    binding.pry
    #looking for size, color, breed, shelter, contact, bio, and traits
    breed = doc.css('div.h4__heading, h4--light, h4--compact')[1].text.strip
    color = doc.css('div.h4__heading, h4--light, h4--compact')[3].text.strip
    size = doc.css('div.h4__heading, h4--light, h4--compact')[7].text.strip
    traits = doc.css('div.myinfo__content div.myinfo__label span:nth-child(even)')
    shelter = doc.css('section.js-contact-info div.formgroup__content-section a').first.text
    contact = doc.css('section.js-contact-info div.formgroup__content-section a')[1].text
  end
end
