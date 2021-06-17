class HairlessFurever::CLI
    
    def call
        #start scraping method
        HairlessFurever::DogCatcher.catch_dog_breeds
        #welcome user and set flow of program
        puts "\nWelcome to Hairless Furever!\n"
        puts "\nHere you can learn all about hairless dog breeds.\n"
        puts "U・ᴥ・U"
        puts " u u"
        @input = ""
        until @input == "exit"
            fetched_dogs
            fetch_user_dog
        end
        farewell
    end

    def fetched_dogs
        #getting all the dog breeds
        @dogs = HairlessFurever::Dog.all
        puts "Please enter the number of the dog you would like more information on." 
        @dogs.each.with_index(1) {|dog, index| puts "#{index}. #{dog.name}"}
    end

    def fetch_user_dog
        chosen_dog = gets.strip.to_i
        #getting and checking user input to make sure it is valid 
        show_dog(chosen_dog) if valid_input(chosen_dog, @dogs) 
    end

    def valid_input(user_input, data)
        #input needs to be less than the amount of data(dog breeds) but more than 0 and can't be a negative number 
        user_input.to_i.between?(1, data.length)
        #user_input.to_i <= data.length && user_input.to_i > 0 also works
       
    end

    def show_dog(chosen_dog)
        #show dog name and description 
        dog = @dogs[chosen_dog -1]
        puts "#{dog.name}: #{dog.description}"
        puts "Would you like to get more informaion on this dog? (y/n)"
        @input = gets.strip
        if @input == "y"
            details(chosen_dog)
        else
            continue
        end
    end

    def details(chosen_dog)
        #show more details about the selected dog breed
        dog = @dogs[chosen_dog -1]
        puts "#{dog.height}"
        puts "#{dog.weight}"
        puts "#{dog.physical_characteristics}"
        continue
    end

    def continue
        #see if user wants to continue or exit
        puts "Press any key to see the list of dogs again. Type 'exit' to leave."
        @input = gets.strip
    end

    def farewell
        puts ""
        puts "             /)-_-(\\"       
        puts "              (o o)"          
        puts "      .-----__/\\o/"           
        puts "     /  __      / "             
        puts " \\__/\\ /  \\_\\ |/ "                
        puts "      \\\\     || "                 
        puts "      //     || "                 
        puts "      |\\     |\\ "                 
        puts "\nThanks for stopping by.\n"
        puts ""
    end
    
end