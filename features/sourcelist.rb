Given('Navbar receives wikipedia article') do
    @URL = "https://en.wikipedia.org/wiki/World_War_II"
    @URl.isWiki == true
end

When('I list the sources') do
    puts @URL.listSources
end

And('Sources have subtitles') do
    @URL.hasSubtitles == true
end

Then ('I display the sources categorized by subtitles') do
    puts @URL.listCategorizedSources
end