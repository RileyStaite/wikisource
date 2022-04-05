require 'open-uri'
require 'nokogiri'

wiki_link = "https://en.wikipedia.org/wiki/recursion"
file = URI.open(wiki_link)
page_data = Nokogiri::HTML5(file)    

reference_list = []
sources = []

new_page_data = page_data.css(".references").css("a")

new_page_data.xpath("//ol[@class='references']").each do |description|
    reference_list += description.xpath('//a[@rel="nofollow"]')
    sources = Hash[
        *reference_list.each().map { |a|
            [
            a.content,
            a['href']
            ]
    }.flatten
    ]
    
puts sources

end