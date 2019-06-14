class ShelterPets::Scraper 
  attr_accessor :zip
  
  def initialize(zip = "89120")
    @html = Nokogiri::HTML(open("https://theshelterpetproject.org/pet-search/?zip=#{zip}&radius=25&species=dog&resultPage=1"))
  end 
  
  def html 
    puts @html 
  end
end 