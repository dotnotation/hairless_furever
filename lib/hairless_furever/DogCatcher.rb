class HairlessFurever::DogCatcher
 
    def self.catch_dog_breeds
        doc = Nokogiri::HTML(open("https://www.thesprucepets.com/hairless-dog-breeds-4801015"))
        breeds = doc.css("ul#sc-list_1-0")
        
        breeds.each do |b| 
            name = b.css(".mntl-sc-block-heading").text.strip
            description = b.css("p.comp.text-passage").text
            binding.pry
            HairlessFurever::Dog.find_or_create_by_name(name, description)
            #binding.pry
        end
    end
    
   

    #     details = doc.css("ul#sc-list_1-0 #mntl-sc-block-callout-body_1-0-1")
    #     page.collect do |attribute|
    #         {:description => attribute.css("mntl-sc-block_2-0-2").text,
    #         :height => details.css("p")[0].text.split(":")[1],
    #         :weight => details.css("p")[1].text.split(":")[1],
    #         :physical_characteristics => details.css("p")[2].text.split(":")[1]}
    #         binding.pry
    #     end
    # end
end