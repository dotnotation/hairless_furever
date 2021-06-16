class HairlessFurever::Dog
    attr_reader :name, :description, :height, :weight, :physical_characteristics

    @@all = []
    
    def initialize(name, description, height, weight, physical_characteristics)
        @name = name
        @description = description
        @height = height
        @weight = weight
        @physical_characteristics = physical_characteristics
        #binding.pry
    end

    def save
        @@all << self
    end

    def self.all
        #HairlessFurever::DogCatcher.catch_dog_breeds if @@all.empty?
        @@all 
        #binding.pry
    end

    def self.create(name, description, height, weight, physical_characteristics)
        dog = self.new(name, description, height, weight, physical_characteristics)
        dog.save
        dog
    end

    def self.find_by_name(name)
        self.all.detect {|dog| dog.name == name}
    end

    def self.find_or_create_by_name(name, description, height, weight, physical_characteristics)
        if dog = self.find_by_name(name)
            dog
        else
            self.create(name, description, height, weight, physical_characteristics)
        end
    end
end