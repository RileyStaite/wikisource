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

  #method for getting array of sources from url
  def get_sources
    return ["url1", "url2", "url3"]
  end
end
