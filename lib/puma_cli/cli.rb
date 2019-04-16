class PumaCli::CLI

    def start
        puts "Loading"
        PumaCli::Scraper.scrape_page
        list_sales
        menu 
        goodbye
    end 

    def list_sales
        
        PumaCli::Products.all.each.with_index(1) do |sale_item, i|
            puts "#{i}. #{sale_item.name}"
        end 
    end 

    def menu
        
        puts "Please select product name above:"
        input = gets.chomp

        name = PumaCli::Products.all[input.to_i-1]

        if !name
            puts "Not a valid entry."
            puts "Please enter 1 - 34"
            menu
        else
            PumaCli::Scraper.product_details(name)
            puts "Product details for #{name.product_name}:"
            puts "Sale price: #{name.sale_price}"
            puts "Original price: #{name.orig_price}"        
        end
    end 

    def goodbye
        puts "Thank you for checking out sales!"
        puts "Are you sure you are done shopping?"
        puts "Please type 'Y' or 'N':"
        input = gets.chomp

        if input == 'Y'
            exit
        else
            menu
        end 
    end 
end 