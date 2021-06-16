class HairlessFurever::CLI

    BASE_PATH = "https://www.thesprucepets.com/hairless-dog-breeds-4801015"
    
    def call
        HairlessFurever::DogCatcher.catch_dog_breeds
        puts "Welcome to Hairless Furever!"
        puts " U・ᴥ・U "
        @input = ""
        until @input == "exit"
            fetch_dogs
            fetch_user_dog
            more_information
        end
        farewell
    end
    #get dog breeds
    #list the dog breeds each.with_index(1)
    #ask user which breed they would like more information on
    def fetched_dogs
        @dogs = HairlessFurever::Dog.all
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
        puts "#{dog.name}: #{dog.description}"
    end
    
    def more_information
        puts "Would you like to get more informaion on this dog? (y/n)"
        @input = gets.strip
        if @input == "y"
            details(chosen_dog)
        else
            continue
        end
    end

    def details(chosen_dog)
        dog = @dogs[chosen_dog -1]
        puts "#{dog.height}"
        puts "#{dog.weight}"
        puts "#{dog.physical_characteristics}"
    end

    def continue
        puts "Press any key to see the list of dogs again. Type 'exit' to leave."
        @input = gets.strip
    end

    def farewell
        puts "             /)-_-(\ "       
        puts "              (o o)"          
        puts "      .-----__/\o/"           
        puts "     /  __      / "             
        puts " \__/\ /  \_\ |/ "                
        puts "      \\     || "                 
        puts "      //     || "                 
        puts "      ||     || "                 
        puts "Thanks for stopping by."
    end
    
end