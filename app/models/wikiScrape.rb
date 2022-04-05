require 'nokogiri'
require 'open-uri'

class WikipediaScraper

    def scrape_references
    #Get this link from searchbar
        wiki_link = "https://en.wikipedia.org/wiki/Ruby_(programming_language)"
        file = URI.open(wiki_link)
        page_data = Nokogiri::HTML5(file)    
        reflist_links = page_data.css('.reference-text')
        reflist_content = page_data.css('.reference-text')

        puts reflist_content

        reflist_links.each do |reference|
            url = reference.css('a').attribute('href').value
            content = reference.text
            p content
            p url
        end
        #reflist_links = page_data.css(".references").css("a")
        #p page_data.xpath('//div[@class="reference-text"]/a').map { |link| link['href'] }
        #reference_list = []
        #Testing
        #p page_data
        #p reflist
        #p reflist_links
        #p file
    end

end

scrape = WikipediaScraper.new
scrape.scrape_references  

    #For improvement:
    #Remove all text ending in .mw-parser-output
    #Remove retreived, also takes the form of (xyz, 20xx)
    #Add "..." and cut off long reference descriptions
    #If page_data contains aria-label="Jump Up" inside a references list, 
    #Then remove div references but only the first one
    # ^ That is the "notes" section which is a reflist class on wiki pages  

