class SourceController < ApplicationController
  def index
    if(params["search"] == nil)
      params["search"] = "Search"
    end
  end

  #method for taking url from search bar
  def get_url 
    return "https://www.wikipedia.org/"
  end

  def home
    #the views would work best if this sources instance variable was a hash 
    @sources = {"www.ruby-lang.org"=>"https://www.ruby-lang.org/", "RubyGems.org"=>"http://rubygems.org", "https://www.ruby-lang.org/en/news/2022/02/18/ruby-3-1-1-released/"=>"https://www.ruby-lang.org/en/news/2022/02/18/ruby-3-1-1-released/", "\"Reasons behind Ruby\""=>"https://confreaks.tv/videos/rubyconf2008-reasons-behind-ruby", "Practical JRuby on Rails Web 2.0 Projects: Bringing Ruby on Rails to Java"=>"https://archive.org/details/practicaljrubyon0000bini/page/3", "3"=>"https://archive.org/details/practicaljrubyon0000bini/page/3", "\"Ioke\""=>"https://web.archive.org/web/20110721091046/http://www.ioke.org/", "the original"=>"http://www-4.ibm.com/software/developer/library/ruby.html", "\"Julia 1.0 Documentation: Introduction\""=>"https://docs.julialang.org/en/stable/", "\"About Nu™\""=>"http://programming.nu/about", "\"Ring and other languages\""=>"http://ring-lang.sourceforge.net/doc1.6/introduction.html#ring-and-other-languages", "\"The Rust Reference\""=>"https://doc.rust-lang.org/reference/influences.html", "\"Chris Lattner's Homepage\""=>"http://nondot.org/sabre/", "\"About Ruby\""=>"https://www.ruby-lang.org/en/about/", "\"The Ruby Language FAQ\""=>"https://www.ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html", "\"Re: Ruby's lisp features\""=>"http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/179642", "\"History of Ruby\""=>"http://blog.nicksieger.com/articles/2006/10/20/rubyconf-history-of-ruby", "\"[FYI: historic] The decisive moment of the language name Ruby. (Re: [ANN] ruby 1.8.1)\""=>"http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/88819", "\"1.3 Why the name 'Ruby'?\""=>"https://www.ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html", "\"Re: the name of Ruby?\""=>"http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/394", "\"More archeolinguistics: unearthing proto-Ruby\""=>"https://web.archive.org/web/20151106023204/http://eigenclass.org/hiki/ruby+0.95", "\"[ruby-talk:00382] Re: history of ruby\""=>"http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/382", "\"[ruby-list:124] TUTORIAL — ruby's features\""=>"http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-list/124", "\"An Interview with the Creator of Ruby\""=>"https://linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html", "\"Programming Ruby: Forward\""=>"http://ruby-doc.com/docs/ProgrammingRuby/html/foreword.html", "\"We retire Ruby 1.8.7\""=>"https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/"}
  end 
  
  def about
  end 
  #method for getting array of sources from url
  def get_sources
    return ["url1", "url2", "url3"]
  end
end
