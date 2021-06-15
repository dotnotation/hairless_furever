class HairlessFurever::Dog
    attr_reader :name, :description, :height, :weight, :physical_characteristics

    @@all = []
    
    def initialize(name, description)
        @name = name
        @description = description
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

    def self.create(name, description)
        dog = self.new(name, description)
        dog.save
        dog
    end

    def self.find_by_name(name)
        self.all.detect {|dog| dog.name == name}
    end

    def self.find_or_create_by_name(name, description)
        if dog = self.find_by_name(name)
            dog
        else
            self.create(name, description)
        end
    end
end