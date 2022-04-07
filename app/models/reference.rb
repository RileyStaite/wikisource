class Reference < ActiveRecord::Base
    validates_presence_of :url

   self.abstract_class = true

    def self.parse (url)
      link = URI.open(url)
      doc = Nokogiri.HTML5(link)
      sources = []
      ref_list = []
      doc.xpath("//ol[@class='references']").each do |ref|
        ref_list += ref.xpath('//a[@rel="nofollow"]')
        sources = Hash[
        *ref_list.each().map { |a| 
            [
              a.content,
              a['href']
            ]
          }.flatten
        ]
        end
        return sources
    end

    def self.scrape_references (wiki_link)
      file = URI.open(@url)
      page_data = Nokogiri::HTML5(file)
      page_data.css('style').remove # Removes a style glitch inside reference classes on some wiki pages by mediawiki api
      reflist = page_data.css('.reference-text') # Only grabs data from class 'reference-text'
      
      content_array = [] # holds reference info
      url_array = [] # holds reference link
      source_hash = [] # info is key, link is data
      i = 0



      reflist.each do |reference| 
          content = reference.text
					if (reference.css('a').attribute('href') != nil)
	          url = reference.css('a').attribute('href').value
	          content.tr!('"', '') # remove backslashes
	          url.tr!('"', '') # remove backslashes
					else 
						url = reference.css('a').attribute('href')
						content.tr!('"', '') # remove backslashes
					end

          content_array[i] = content
          url_array[i] = url
          # puts content_array[i] # testing
          # puts url_array[i] # testing
          i += 1
          # puts content # testing
          # puts url # testing
      end
      source_hash = Hash[content_array.zip(url_array)]
      return source_hash # testing
  end

      
end
  