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

    # description: doc.css("ul#sc-list_1-0 #mntl-sc-block_2-0-2")
    # attributes: things = doc.css("ul#sc-list_1-0 #mntl-sc-block-callout-body_1-0-1")
        # height: things.each{|r| puts r.css("p")[0].text}
        # weight: things.each{|r| puts r.css("p")[1].text}
        # physical characteristics: things.each{|r| puts r.css("p")[2].text} 
            #puts things.css("p")[2].text.split(":")[1] if we just want the second half of the text not the height: part

end