class HairlessFurever::DogCatcher

    def self.catch_dog_breeds
        site = "https://www.thesprucepets.com/hairless-dog-breeds-4801015"
        doc = Nokogiri::HTML(open(site))
        breeds = doc.css("ul#sc-list_1-0 .mntl-sc-block-heading")
        breeds.each do |b| 
            breed = b.text.strip
            HairlessFurever::Dog.new(breed)
            #binding.pry
        end
    end
    
    def self.scrape_description(dog)
        site = "https://www.thesprucepets.com/hairless-dog-breeds-4801015"
        doc = Nokogiri::HTML(open(site))
        descriptions = doc.css("ul#sc-list_1-0 #mntl-sc-block_2-0-2")
        descriptions.each do |d|
            get_description = d.text.strip
            dog.description << get_description
        end
    end

    # description: doc.css("ul#sc-list_1-0 #mntl-sc-block_2-0-2")
    # attributes: things = doc.css("ul#sc-list_1-0 #mntl-sc-block-callout-body_1-0-1")
        # height: things.each{|r| puts r.css("p")[0].text}
        # weight: things.each{|r| puts r.css("p")[1].text}
        # physical characteristics: things.each{|r| puts r.css("p")[2].text} 
            #puts things.css("p")[2].text.split(":")[1] if we just want the second half of the text not the height: part
    # def self.attributes
    #     site = "https://www.thesprucepets.com/hairless-dog-breeds-4801015"
    #     doc = Nokogiri::HTML(open(site))
    #     page = doc.css("sc-list_1-0")
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