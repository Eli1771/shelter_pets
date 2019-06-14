class ShelterPets::Scraper 
  attr_accessor :zip
  
  def initialize
    @zip = ShelterPets::CLI.zip
  end
  
  def dogs_by_zip 
    @html = Nokogiri::HTML(open("https://theshelterpetproject.org/pet-search/?zip=#{@zip}&radius=25&species=dog&resultPage=1"))
  end 
  
  def html 
    puts @html 
  end
end 