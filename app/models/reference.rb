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

      
end
  