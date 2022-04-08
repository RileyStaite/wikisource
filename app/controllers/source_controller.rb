class SourceController < ApplicationController
  def index
    @link = params["search"]
    if(params["search"] == nil)
      params["search"] = "Search"
    end
    #the views would work best if this sources instance variable was a hash
    @link = params["search"]
    @sources = Reference.scrape_references(params["search"])
    @page = Wikipedia.find(params["search"])
    if @sources[:status] == :completed && @sources[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:notice] = "Unable to find references from given URL"
    end
    rescue StandardError => e
      flash.now[:alert] = "Error: #{e}" 
  end

  def home
    #the views would work best if this sources instance variable was a hash
    @link = params["search"]
    @sources = Reference.scrape_references(params["search"])
    @page = Wikipedia.find(params["search"])
    if @sources[:status] == :completed && @sources[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:notice] = "Unable to find references from given URL"
    end
    rescue StandardError => e
      flash.now[:alert] = "Error: #{e}"
  end 
  
  def about
  end 
end
