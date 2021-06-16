class HairlessFurever::DogCatcher

    def self.catch_dog_breeds
        doc = Nokogiri::HTML(open("https://www.thesprucepets.com/hairless-dog-breeds-4801015"))
        doc.css("ul#sc-list_1-0").each do |breed| 
            name = breed.css(".mntl-sc-block-heading").text.strip
            description = breed.css("p.comp.text-passage").text
            #the below variables don't work
            height = breed.css(".comp.mntl-sc-block-callout-body p").text
            weight = breed.css(".comp.mntl-sc-block-callout-body p").text
            physical_characteristics = breed.css(".comp.mntl-sc-block-callout-body p").text
            #binding.pry
            HairlessFurever::Dog.find_or_create_by_name(name, description, height, weight, physical_characteristics)
            #binding.pry
        end
    end

        # def self.catch_dog_breeds(index_url)
    #     doc = Nokogiri::HTML(open(index_url))
    #     #height, weight, and physical characteristics still need to be fixed
    #     breeds = []
    #     doc.css("ul#sc-list_1-0").each do |b|
    #         breed_name = b.css(".mntl-sc-block-heading").text.strip
    #         breed_description = b.css("p.comp.text-passage").text
    #         breed_height = b.css(".comp.mntl-sc-block-callout-body").children.css("p")[0].text
    #         breed_weight = b.css(".comp.mntl-sc-block-callout-body p")[1].text
    #         breed_physical_characteristics = b.css(".comp.mntl-sc-block-callout-body p")[2].text
    #             binding.pry
    #         breeds << {name: breed_name, description: breed_description, height: breed_height, weight: breed_weight, physical_characteristics: breed_physical_characteristics}
    #             #binding.pry
    #     end
    #     breeds
    # end

end