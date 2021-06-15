class HairlessFurever::DogCatcher
 
    def self.catch_dog_breeds
        doc = Nokogiri::HTML(open("https://www.thesprucepets.com/hairless-dog-breeds-4801015"))
        breeds = doc.css("ul#sc-list_1-0")
        
        breeds.each do |b| 
            name = b.css(".mntl-sc-block-heading").text.strip
            description = b.css("p.comp.text-passage").text
            height = b.css(".comp.mntl-sc-block-callout-body p")[0].text
            weight = b.css(".comp.mntl-sc-block-callout-body p")[1].text
            physical_characteristics = b.css(".comp.mntl-sc-block-callout-body p")[2].text
            #binding.pry
            HairlessFurever::Dog.find_or_create_by_name(name, description, height, weight, physical_characteristics)
            #binding.pry
        end
    end
end