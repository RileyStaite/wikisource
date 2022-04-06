require 'nokogiri'
require 'open-uri'

class WikipediaScraper

    def scrape_references
        wiki_link = "https://en.wikipedia.org/wiki/Ruby_(programming_language)" # Get this link from searchbar
        file = URI.open(wiki_link)
        page_data = Nokogiri::HTML5(file)
        page_data.css('style').remove # Removes a style glitch inside reference classes on some wiki pages by mediawiki api
        reflist = page_data.css('.reference-text') # Only grabs data from class 'reference-text'
        
        content_array = [] # holds reference info
        url_array = [] # holds reference link
        source_hash = [] # info is key, link is data
        i = 0

        reflist.each do |reference| 
            content = reference.text
            url = reference.css('a').attribute('href').value
            content.tr!('"', '') # remove backslashes
            url.tr!('"', '') # remove backslashes

            content_array[i] = content
            url_array[i] = url
            # puts content_array[i] # testing
            # puts url_array[i] # testing
            i += 1
            # puts content # testing
            # puts url # testing
        end
        source_hash = Hash[content_array.zip(url_array)]
        puts source_hash # testing
    end
end

scrape = WikipediaScraper.new
scrape.scrape_references  

    # Improvements:
    # For sprint 2-2:
    # 1. Implement in views + controller
    # 2. Get wiki link from stream

    # After sprint 2-2
    # 1. Possibly remove "retreived on" dates, also takes the form of (xyz, 20xx) (or store these for sorting)
    # 2. Add "..." and cut off long reference descriptions
    # 3. If reference links contain aria-label="Jump Up" inside reflist url, 
    #   Then remove div references but only the first one
    #   That is the "notes" section which is a reflist class on wiki pages  