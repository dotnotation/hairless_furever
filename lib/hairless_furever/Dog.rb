class HairlessFurever::Dog
    attr_accessor :breed

    @@all = []
    
    def initialize(breed)
        @breed = breed
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end