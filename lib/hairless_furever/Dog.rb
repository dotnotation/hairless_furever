class HairlessFurever::Dog
    attr_accessor :name

    @@all = []
    
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        HairlessFurever::DogCatcher.catch_dog_breeds if @@all.empty?
        @@all
        #binding.pry
    end
end