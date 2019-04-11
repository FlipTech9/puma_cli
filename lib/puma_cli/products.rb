#class Products
class PumaCli::Products

    attr_accessor :name, :url, :sale_price, :orig_price, :product_name  
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url 
        #@@all << self

    end 

    def save
        @@all << self 
    end 

    def self.all
        @@all 
    end
end 
