class PumaCli::Sale
    attr_accessor :name, :price, :availability, :url 

    def self.today
        puts "Puma sale items:"
        puts "1. PUMA ONE 1 Leather FG/AG Men's Soccer Cleats"
        puts "2.PUMA ONE 1 Syn FG/AG"
    
        sale_1 = self.new 
        sale_1.name = "PUMA ONE 1 Leather FG/AG Men's Soccer Cleats"
        sale_1.price = "139.99"
        sale_1.availability = true 
        sale_1.url = "https://us.puma.com/en/us/pd/puma-one-1-leather-fg%2Fag-mens-soccer-cleats/104735.html?dwvar_104735_color=Sodalite%20Blue-Silver-Peacoat"

        sale_2 = self.new 
        sale_2.name = "PUMA ONE 1 Syn FG/AG"
        sale_2.price = "139.99"
        sale_2.availability = true 
        sale_2.url = "https://us.puma.com/en/us/pd/puma-one-1-syn-fg%2Fag/104722.html?dwvar_104722_color=Silver-Orange-Black"

        #return sales of the day 

        [sale_1, sale_2]
         
    end 

end 