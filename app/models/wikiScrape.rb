require 'nokogiri'
require 'open-uri'

class WikipediaScraper

    def scrape_references
        # Get this link from searchbar
        wiki_link = "https://en.wikipedia.org/wiki/Ruby_(programming_language)"
        file = URI.open(wiki_link)
        page_data = Nokogiri::HTML5(file)    
        reflist = page_data.css('.reference-text')

        reflist.each do |reference|
            url = reference.css('a').attribute('href').value
            content = reference.text
            p content
            p url
        end
    end
end

scrape = WikipediaScraper.new
scrape.scrape_references  

    #For improvement:
    # 1. Possibly remove "retreived on" dates, also takes the form of (xyz, 20xx)
    # 2. Add "..." and cut off long reference descriptions
    # 3. If reference links contain aria-label="Jump Up" inside reflist url, 
    #   Then remove div references but only the first one
    #   That is the "notes" section which is a reflist class on wiki pages  


    #Old testing code, will be gone
        #reflist_links = page_data.css(".references").css("a")
        #p page_data.xpath('//div[@class="reference-text"]/a').map { |link| link['href'] }
        #reference_list = []
