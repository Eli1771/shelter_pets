class ShelterPets::Scraper 
  attr_accessor :zip, :all_dogs, :dog
  
  def initialize(zip = '89120')
    @zip = zip
  end
  
  def dogs_by_zip 
    doc = Nokogiri::HTML(open("https://adoptapet.com/dog-adoption/search/50/miles/89074"))
    doc
    binding.pry
  end 
  

end 