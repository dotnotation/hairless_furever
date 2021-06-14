class HairlessFurever::DogCatcher

    def self.catch_dog_breeds
        site = "https://www.thesprucepets.com/hairless-dog-breeds-4801015"
        doc = Nokogiri::HTML(open(site))
        breeds = doc.css("ul#sc-list_1-0 .mntl-sc-block-heading")
        breeds.each do |b| 
            name = b.text.strip
            HairlessFurever::Dog.new(name)
            #binding.pry
        end
    end
end