class HairlessFurever::CLI
    def call
        puts "Welcome to Hairless Furever!"
        fetch_dog
        fetched_dogs_list
        fetch_user_dog
    end
    #get dog breeds
    def fetch_dog
        #to be scraped later
        @dogs = ["American Hairless Terrier", "Chinese Crested", "Xoloitzcuintli", "Peruvian Inca Orchid", "Argentine Pila Dog", "Abyssinian Sand Terrier", "Hairless Khala", "Jonangi", "Ecuadorian Hairless Dog", "Hairless Chihuahua"]
    end

    #list the dog breeds fetched_dogs_list each.with_index(1)
    #ask user which breed they would like more information on
    def fetched_dogs_list
        puts "Please enter the number of the dog you would like more information on or 'exit' to leave." 
        @dogs.each.with_index(1) {|month, index| puts "#{index}. #{month}"}
    end

    #get user input
    def fetch_user_dog
        chosen_dog = gets.strip
        #need to check user input to make sure it is valid also need to make exit valid
        if valid_input(chosen_dog, @dogs)
        end
        binding.pry
    end

    def valid_input(user_input, data)
        #input needs to be less than ten but more than 0 and can't be a negative number but need to make exit valid
        user_input.to_i <= data.length && user_input.to_i > 0
    end
    #give attributes of chosen dog
end