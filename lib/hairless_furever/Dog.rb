class HairlessFurever::Dog
    attr_accessor :name, :description, :height, :weight, :physical_characteristics

    @@all = []
    
    def initialize(name, description)
        @name = name
        @description = description
        save
    end

    def save
        @@all << self
    end

    def self.all
        HairlessFurever::DogCatcher.catch_dog_breeds if @@all.empty?
        @@all 
    end
end