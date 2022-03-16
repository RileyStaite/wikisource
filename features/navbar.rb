Given('I receive a URL') do
    @URL = "https://en.wikipedia.org/wiki/World_War_II"
end

When('I verify the URL is a wikipedia article') do
    @URL.isWiki == true
end

Then('I display the sources from that article') do
    puts "Sources: #{@URL.listSources}"
end