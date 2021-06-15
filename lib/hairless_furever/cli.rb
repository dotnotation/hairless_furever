class HairlessFurever::CLI
    def call
        puts "Welcome to Hairless Furever!"
        @input = ""
        until @input == "exit"
            fetch_dog
            fetched_dogs_list
            fetch_user_dog
            continue
        end
        farewell
    end
    #get dog breeds
    def fetch_dog
        @dogs = HairlessFurever::Dog.all
        #binding.pry
    end

    #list the dog breeds fetched_dogs_list each.with_index(1)
    #ask user which breed they would like more information on
    def fetched_dogs_list
        puts "Please enter the number of the dog you would like more information on." 
        @dogs.each.with_index(1) {|dog, index| puts "#{index}. #{dog.name}"}
        #binding.pry
    end

    #get user input
    def fetch_user_dog
        chosen_dog = gets.strip.to_i
        #need to check user input to make sure it is valid 
        show_dog(chosen_dog) if valid_input(chosen_dog, @dogs) 
    end

    def valid_input(user_input, data)
        #input needs to be less than ten but more than 0 and can't be a negative number 
        user_input.to_i <= data.length && user_input.to_i > 0
       
    end

    def show_dog(chosen_dog)
        #show dog name and description 
        dog = @dogs[chosen_dog -1]
        puts "#{dog.name} : #{dog.description}"
    end
    

    def continue
        puts "Press any key to see the list of dogs again. Type 'exit' to leave."
        @input = gets.strip
    end

    def farewell
        puts "Thanks for stopping by."
    end
    
end