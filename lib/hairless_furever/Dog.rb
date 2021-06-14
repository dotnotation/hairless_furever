class HairlessFurever::Dog
    attr_accessor :breed, :description, :height, :weight, :physical_characteristics

    @@all = []
    
    def initialize(breed)
        @breed = breed
        @description = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        HairlessFurever::DogCatcher.catch_dog_breeds if @@all.empty?
        @@all 
    end

    def description
        HairlessFurever::DogCatcher.scrape_description(self) if @description.empty?
    end
end