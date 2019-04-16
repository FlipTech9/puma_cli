class PumaCli::Scraper

    PUMA = "https://us.puma.com/en/us/mens/sale/shoes"
       
    def self.scrape_page
        
        html = open(PUMA)
        doc = Nokogiri::HTML(html)
        
        doc.css("div.product-grid__container div.product-tile div.tile-body div.pdp-link").each do |product_name|
            
            name = product_name.css("a").text.strip
            url = product_name.css("a").attr("href").value
            product_name = PumaCli::Products.new(name, url)
            product_name.save
        end 
       
    end

    def self.product_details(name)
        
        html = open(PUMA + name.url) 
        doc = Nokogiri::HTML(html)
        name.product_name = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[2].strip
        name.sale_price = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[9].strip
        name.orig_price = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[12].strip
        
    end 

end 