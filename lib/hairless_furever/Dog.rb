class HairlessFurever::Dog
    attr_reader :name, :description, :height, :weight, :physical_characteristics

    @@all = []
    
    def initialize(name, description)
        @name = name
        @description = description
        #binding.pry
        #save
    end

    def save
        @@all << self
    end

    def self.all
        HairlessFurever::DogCatcher.catch_dog_breeds if @@all.empty?
        @@all 
        binding.pry
    end

    def self.create(name, description)
        dog = self.new(name, description)
        dog.save
        dog
    end
end