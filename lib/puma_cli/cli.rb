#class CLI
class PumaCli::CLI

    def start
        puts "Loading"
        PumaCli::Scraper.scrape_page
        #Scraper.scrape_page
        list_sales
        menu 
        goodbye
    end 

    def list_sales
        #list sale items
        # puts "Puma sale items:"
        # puts "1. RS-0 SOUND Men's Sneakers"
        # puts "2.IGNITE Limitless SR evoKNIT Men's Sneakers"
        # @sales = PumaCli::Sale.today 
        # @sales.each.with_index(1) do |sale, i|
        #     puts "#{i}. #{sale.name} - #{sale.price} - #{sale.availability}"
        # end
        
        PumaCli::Products.all.each.with_index(1) do |sale_item, i|
        #Products.all.each.with_index(1) do |sale_item, i|
            puts "#{i}. #{sale_item.name}"
        end 
    end 

    def menu
        # input = nil
        # puts "Type enter to display sale items and type exit when done viewing"
        
        # while input != "exit"
        #     input = gets.strip.downcase
            
        #     if input.to_i < 0 
        #         # the_sales = @sales[input.to_i-1] 
        #         # puts "#{sale.name} - #{sale.price} - #{sale.availability}" 
        #     elsif   input == "enter"
        #         list_sales  
        #     else 
        #         puts "Please type enter to view list or type exit"
    
        #     # case input 
        #     # when "enter"
        #     #     list_sales
        #     # else
        #     #     puts "Please type enter to view list or type exit"
        #     end 
        #end 

        puts "Please select product name above:"
        #list_sales
        input = gets.chomp

        name = PumaCli::Products.all[input.to_i-1]
        #name = Products.all[input.to_i-1]

        if !name
            puts "Not a valid entry."
            puts "Please enter 1 - 34"
            menu
        else
            PumaCli::Scraper.product_details(name)
            puts "Product details for #{name.product_name}:"
            puts "Sale price: #{name.sale_price}"
            puts "Original price: #{name.orig_price}"
            
            #Scraper.product_details(name)
        end 

        # input = nil
        # #puts "Type enter to display sale items and type exit when done viewing"
        # puts "Please select product number above:"
        # while input != "exit"
        #     input = gets.strip.downcase
        #     name = PumaCli::Products.all[input.to_i-1]
            
        #     if !name
        #         puts "Not a valid entry."
        #         puts "Please enter 1 - 34"
        #         menu
        #     elsif   input == "enter"
        #         list_sales  
        #     else 
        #         puts "Please type enter to view list or type exit"

        #         PumaCli::Scraper.product_details(name)
        #         puts "Product details for #{name.product_name}:"
        #         puts "Sale price: #{name.sale_price}"
        #         puts "Original price: #{name.orig_price}"
    
            # case input 
            # when "enter"
            #     list_sales
            # else
            #     puts "Please type enter to view list or type exit"
            #end 
        #end 
    end 

    def goodbye
        puts "Thank you for checking out sales!"
    end 

    
end 