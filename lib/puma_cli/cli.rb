class PumaCli::CLI

    def call
        
        #list_sales
        menu 
        goodbye
    end 

    def list_sales
        #list sale items
        puts "Puma sale items:"
        puts "1. RS-0 SOUND Men's Sneakers"
        puts "2.IGNITE Limitless SR evoKNIT Men's Sneakers"
        
    end 

    def menu
        puts "Type enter to display sale items and type exit when done viewing"
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input 
            when "enter"
                list_sales
            else
                puts "Please hit enter to view list or type exit"
                #list_sales 
            end 
        end 
    end 

    def goodbye
        puts "Thank you for checking out sales!"
    end 

    
end 