#class Scraper
class PumaCli::Scraper

    PUMA = "https://us.puma.com/en/us/mens/sale/shoes"
    #"https://us.puma.com/en/us/mens/sale/shoes#pagesize=206"
   
    def self.scrape_page
        # html = open("https://us.puma.com/en/us/mens/shoes#pagesize=682")
        # doc = Nokogiri::HTML(html)

        #test sale page strike-through
        html = open(PUMA)
        doc = Nokogiri::HTML(html)
        #binding.pry 
        #doc.css("div.product-grid__container div.product-tile").first
        doc.css("div.product-grid__container div.product-tile div.tile-body div.pdp-link").each do |product_name|
            #binding.pry
            name = product_name.css("a").text.strip
            url = product_name.css("a").attr("href").value
            product_name = PumaCli::Products.new(name, url)
            #product_name = Products.new(name, url)
            product_name.save
        end 
        #product_tile = doc.css("div.product-tile")

        # product_tile.each do |product_node|
        #     product_name = product_node.css(self)[0]["data-track-link-title"]
        # end

        #doc.css(".product-tile").each do |product_node|
        #     binding.pry 
        # end 
    end

    def self.product_details(name)
        #product_title = scrape_page.css("div.tile-body div.pdp-link a.link").text
        #product_title_slice = product_title.slice(1, product_title.length)
        #binding.pry 
        html = open(PUMA + name.url) 
        doc = Nokogiri::HTML(html)
        name.product_name = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[2].strip
        name.sale_price = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[9].strip
        name.orig_price = doc.css("div.product-detail div.container div.pswp__wrapper div.row").text.split("\n")[12].strip
        #binding.pry
    end 

end 