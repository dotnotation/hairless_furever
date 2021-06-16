class HairlessFurever::DogCatcher

    def self.catch_dog_breeds
        doc = Nokogiri::HTML(open("https://www.thesprucepets.com/hairless-dog-breeds-4801015"))
        doc.css("ul#sc-list_1-0").each do |breed| 
            name = breed.css(".mntl-sc-block-heading").text.strip
            description = breed.css("p.comp.text-passage").text
            #the below variables don't work
            height = breed.css(".comp.mntl-sc-block-callout-body p:first").text
            weight = breed.css(".comp.mntl-sc-block-callout-body p").text
            physical_characteristics = breed.css(".comp.mntl-sc-block-callout-body p:last").text
            #binding.pry
            HairlessFurever::Dog.find_or_create_by_name(name, description, height, weight, physical_characteristics)
            #binding.pry
        end
    end
end